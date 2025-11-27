//
//  SHDAlert.swift
//  ShadcniOS
//
//  Created by JoseAlvarez on 11/19/25.
//

import SwiftUI

/// A lightweight alert component used in the Shadcn iOS design system.
///
/// ### Overview
/// `SHDAlert` provides a structured way to display informational messages with
/// a title, descriptive text, and a contextual icon. The component separates
/// content (title and message) from visual styling, which is applied through
/// the `.alertStyle(...)` modifier using `SHDAlertStyle`.
///
/// This separation ensures full flexibility:
/// - Consumers can reuse the same alert content with different visual styles
/// - The alert's appearance can evolve independently of its content structure
/// - Styling is centralized and consistent across the design system
///
/// `SHDAlert` pairs with `SHDAlertStyle` to create a complete alert system
/// that is consistent, modular, and easy to configure.
///
/// ### Layout Structure
///
/// The alert is composed of:
/// - A leading icon (automatically selected based on style)
/// - A vertical stack containing:
///   - Title text (displayed in medium weight for emphasis)
///   - Message text (displayed in regular weight with secondary foreground color)
/// - A rounded border container with padding
///
/// Spacing and sizing:
/// - Horizontal spacing between icon and content: `.md`
/// - Vertical spacing between title and message: `.xs`
/// - Internal padding: `.sm` on all sides
/// - Corner radius: `.md`
/// - Border width: `1` point
///
/// ### Style Variants
///
/// The alert supports four semantic styles:
/// - `.default`: Neutral informational messages
/// - `.destructive`: Critical errors or dangerous actions
/// - `.warning`: Non-critical cautionary messages
/// - `.success`: Positive confirmations or successful operations
///
/// Each style automatically applies:
/// - Appropriate icon from `SHDIconAsset`
/// - Primary foreground color for title and icon
/// - Secondary foreground color for message text
/// - Semantic border color matching the alert's context
///
/// ### Usage Examples
///
/// Default style (neutral information):
/// ```swift
/// SHDAlert(title: "Info", message: "This is an informational alert.")
///     .alertStyle(.default)
/// ```
///
/// Success style:
/// ```swift
/// SHDAlert(title: "Success", message: "Your changes have been saved")
///     .alertStyle(.success)
/// ```
///
/// Destructive alert:
/// ```swift
/// SHDAlert(title: "Error", message: "Something went wrong")
///     .alertStyle(.destructive)
/// ```
///
/// Warning alert:
/// ```swift
/// SHDAlert(title: "Warning", message: "This action may have consequences")
///     .alertStyle(.warning)
/// ```
///
/// ### Notes
/// - The `title` is displayed using `.textBaseMedium` text style for emphasis
/// - `message` is displayed using `.textSMRegular` with a secondary foreground color
/// - An icon is automatically displayed based on the selected style
/// - The default style (`.default`) is applied if no style is explicitly specified
/// - The alert uses design system tokens for consistent spacing, colors, and typography
public struct SHDAlert: View {

    // MARK: - Properties

    /// Visual configuration applied to the alert's layout and colors
    private var style: SHDAlertStyle = .default

    /// The alert's title, displayed in a bold font
    let title: String

    /// The descriptive message displayed below the title
    let message: String

    // MARK: - Initializer

    /// Creates a new alert with a title and message.
    ///
    /// The alert will use the default style (`.default`) unless a different
    /// style is applied using the `.alertStyle(...)` modifier.
    ///
    /// - Parameters:
    ///   - title: A short, descriptive heading for the alert. Displayed in
    ///            medium weight text style for emphasis.
    ///   - message: Additional information that describes the alert's context.
    ///              Displayed in regular weight with secondary foreground color.
    public init(title: String, message: String) {
        self.title = title
        self.message = message
    }

    // MARK: - View

    /// The visual representation of the alert.
    ///
    /// Renders a horizontal stack containing:
    /// - A leading icon (from `style.iconAsset`) sized `.lg`
    /// - A vertical stack with the title and message
    /// - A rounded border container with padding
    ///
    /// The appearance is controlled by the current `style` property,
    /// which provides colors, border styling, and icon selection.
    public var body: some View {
        HStack(alignment: .top, spacing: .md) {
            SHDIcon(style.iconAsset)
                .iconSize(.lg)

            VStack(alignment: .leading, spacing: .xs) {
                Text(title)
                    .textStyle(.textBaseMedium)

                Text(message)
                    .textStyle(.textSMRegular)
                    .foregroundColor(style.secondaryForegroundColor)
            }

            Spacer()
        }
        .padding(.all, .sm)
        .background(
            RoundedRectangle(cornerRadius: .md)
                .stroke(style.borderColor.color, lineWidth: 1)
        )
        .padding()
        .foregroundColor(style.primaryForegroundColor)
    }

    /// Applies a visual style to the alert, controlling its appearance.
    ///
    /// This modifier allows you to customize the alert's visual presentation
    /// while keeping the content (title and message) unchanged. The style
    /// determines the icon, colors, and border appearance.
    ///
    /// - Parameter style: The `SHDAlertStyle` to apply. Options include:
    ///   - `.default`: Neutral informational style
    ///   - `.destructive`: For errors or critical messages
    ///   - `.warning`: For cautionary messages
    ///   - `.success`: For positive confirmations
    ///
    /// - Returns: A modified `SHDAlert` instance with the specified style applied.
    ///
    /// ### Example
    /// ```swift
    /// SHDAlert(title: "Error", message: "Operation failed")
    ///     .alertStyle(.destructive)
    /// ```
    public func alertStyle(_ style: SHDAlertStyle) -> Self {
        mutating(keyPath: \.style, value: style)
    }
}

// MARK: Preview

#Preview {
    SHDAlert(title: "Default", message: "You can add components using the cli. ")

    SHDAlert(title: "Destructive", message: "Your session has expired. Please log in again")
        .alertStyle(.destructive)

    SHDAlert(title: "Warning", message: "You can add components using the cli.")
        .alertStyle(.warning)

    SHDAlert(title: "Success", message: "You can add components using the cli.")
        .alertStyle(.success)
}
