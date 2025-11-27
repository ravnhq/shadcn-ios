//
//  SHDAlert.swift
//  ShadcniOS
//
//  Created by JoseAlvarez on 11/19/25.
//

import SwiftUI

/// A lightweight alert component used in the Shadcn iOS desing system
///
/// ### Discussion
/// `SHDAlert` provides a simple structure for displaying a title and message
/// with an icon. The component includes visual styling (colors, icons, borders, spacing)
/// that can be customized using the `.alertStyle(...)` modifier.
///
/// This separation ensures full flexibility:
/// - Consumers  an reuse the same alert content with different visual styles
/// - The alert's appearance can evolve independently of its content structure
///
/// `SHDAlert` pairs with `SHDAlertStyle` to create a complete alert system
/// that is consistent, modular, and easy to configure.
///
/// ### Usage
///
/// Basic alert with success style:
/// ```swift
/// SHDAlert(title: "Success", message: "Your changes have been saved")
///     .alertStyle(.success)
/// ```
///
/// Default style:
/// ```swift
/// SHDAlert(title: "Info", message: "This is an informational alert.")
///     .alertStyle(.default)
/// ```
///
/// Destructive alert:
/// ```swift
/// SHDAlert(title: "Error", message: "Something went wrong")
///     .alertStyle(.destructive)
/// ```
///
/// ### Notes
/// - The `title` is displayed in bold for emphasis
/// - `message` is displayed below the title with a standard text weight
/// - An icon is automatically displayed based on the selected style
/// - The default style is applied if no style is specified
///
/// To customize the alert appearance, use the `.alertStyle(...)` modifier
public struct SHDAlert: View {

    // MARK: - Properties

    /// Visual configuration applied to the alert's layout and colors
    private var style: SHDAlertStyle = .default

    /// The alert's title, displayed in a bold font
    let title: String

    /// The descriptive message displayed below the title
    let message: String

    // MARK: Initializer

    /// Creates a new alert with a title and message
    ///
    /// - Parameters:
    ///     - title: A short, descriptive heading for the alert
    ///     - message: Additional information that describes the alert's context
    public init(title: String, message: String) {
        self.title = title
        self.message = message
    }

    // MARK: - body

    /// The alert's content layout, displaying the title and message
    public var body: some View {
        HStack(alignment: .top, spacing: .md) {
            SHDIcon(style.iconAsset)
                .iconSize(.lg)

            VStack(alignment: .leading, spacing: .xs) {
                Text(title)
                    .textStyle(.textBaseMedium)

                Text(message)
                    .textStyle(.textSMRegular)
                    .foregroundColor(
                        style == .default
                            ? .foregroundMuted : style.foregroundColor
                    )
            }

            Spacer()
        }
        .padding(.all, .sm)
        .background(
            RoundedRectangle(cornerRadius: .md)
                .stroke(style.borderColor.color, lineWidth: 1)
        )
        .padding()
        .foregroundColor(style.foregroundColor.color)
    }

    /// Returns a new alert configured with the provided visual style
    ///
    /// Use this helper to keep the textual content source of truth while customizing the
    /// presentation via `SHDAlertStyle`.
    ///
    /// - Parameter style: The style to apply when rendering the alert
    /// - Returns: A copy of `SHDAlert` that renders with the supplied style
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
