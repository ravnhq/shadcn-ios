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
/// `SHAlert` provides a simple structure for displaying a title and message
/// It renders only the textual content, while all visual styling (colors, icons, borders, spacing)
/// is applied externally using the `.shdAlertStyle(...)` modifier
///
/// This separation ensures full flexibility:
/// - Consumers  an reuse the same alert content with different visual styles
/// - The alert's appearance can evolve independently of its content structure
///
/// `SHDAlert` pairs with `SHDAlertStyle`  and `SHDAlertConfiguration` to create a
/// a complete alert system that is consistent, modular, and easy to configure
///
/// ### Usage
///
/// Basic alert:
/// ```swift
/// SHDAlert(title: "Success", message: "Your chages have been saved")
///     .shdAlertStyle(.success)
/// ```
///
/// Default style:
/// ```swift
/// SHDAlert(title: "Info", message: "This is an informational alert.")
///     .shdAlertStyle()
/// ```
///
///
/// ### Notes
/// - The `title` is displayed in bold for emphasis
/// - `message` is displayed below the title with a standard text weight
/// - Styling is *not* inclued by default
///
/// To render the full alert appearance, always apply .`shdAlertStyle(...)`
public struct SHDAlert: View {

    // MARK: - Properties

    /// The alert's title, displayed in a bold font
    var title: String

    /// The descriptive message displayed below the title
    var message: String

    private var style: SHDAlertStyle = .default

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

    /// The alert's content layout, displaying the title and messge
    public var body: some View {
        HStack(alignment: .top, spacing: .md) {
            SHDIcon(style.iconAsset)
                .iconSize(.lg)

            VStack(alignment: .leading, spacing: .xs) {
                Text(title)
                    .bold()

                Text(message)
            }
        }
        .padding(.all, .sm)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .stroke(style.borderColor.color, lineWidth: 1)
        )
        .padding()
        .foregroundColor(style.foregroundColor.color)
    }

    public func shdAlertStyle(_ style: SHDAlertStyle) -> Self {
        mutating(keyPath: \.style, value: style)
    }
}

// MARK: Preview

#Preview {
    SHDAlert(title: "Default", message: "You can add components using the cli. ")

    SHDAlert(title: "Destructive", message: "Your session has expired. Please log in again")
        .shdAlertStyle(.destructive)

    SHDAlert(title: "Warning", message: "You can add components using the cli.")
        .shdAlertStyle(.warning)

    SHDAlert(title: "Success", message: "You can add components using the cli.")
        .shdAlertStyle(.success)
}
