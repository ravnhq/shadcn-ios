//
//  SHDAlert.swift
//  ShadcniOS
//
//  Created by JoseAlvarez on 11/19/25.
//

import SwiftUI

/// A lightweight alert component used in the Shadcn iOS design system.
///
/// ## Discussion
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
///
/// Creates a new alert with a title and message.
///
/// The alert will use the default style (`.default`) unless a different
/// style is applied using the `.alertStyle(...)` modifier.
///
///  - Parameters:
///   - title: A short, descriptive heading for the alert. Displayed in
///            medium weight text style for emphasis.
///   - message: Additional information that describes the alert's context.
///              Displayed in regular weight with secondary foreground color.
///
/// ## Usage
///
/// ```swift
/// SHDAlert(title: "Info", message: "This is an informational alert.")
///     .alertStyle(.default)
/// ```
public struct SHDAlert: View {

    private var style: SHDAlertStyle = .default

    private let title: String

    private let message: String

    public init(title: String, message: String) {
        self.title = title
        self.message = message
    }

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

    /// Returns a modified `SHDAlert` instance with the specified style applied.
    ///
    /// The alertStyle(_:) modifier customizes the alert’s icon, colors,
    /// and border while keeping its title and message unchanged.
    ///
    /// - Parameters:
    ///     - style: The `SHDAlertStyle` to apply (`.default`, `.destructive`, `.warning`, `.success`)
    public func alertStyle(_ style: SHDAlertStyle) -> Self {
        mutating(keyPath: \.style, value: style)
    }
}

#Preview {
    SHDAlert(title: "Default", message: "You can add components using the cli. ")

    SHDAlert(title: "Destructive", message: "Your session has expired. Please log in again")
        .alertStyle(.destructive)

    SHDAlert(title: "Warning", message: "You can add components using the cli.")
        .alertStyle(.warning)

    SHDAlert(title: "Success", message: "You can add components using the cli.")
        .alertStyle(.success)
}
