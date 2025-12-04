//
//  SHDCard.swift
//  ShadcniOS
//
//  Created by JoseAlvarez on 11/27/25.
//

import SwiftUI

/// A flexible card component used throughout the ShadcniOS design system.
///
/// ### Discussion
/// `SHDCard` provides a structured container for displaying content with a header,
/// customizable body, and footer actions. The card is composed of three main sections:
///
/// - **Header**: Displays a title and description using `SHDCardHeader`
/// - **Body**: Contains custom SwiftUI content provided via the `shdBody` parameter
/// - **Footer**: Contains two action buttons using `SHDCardFooter`
///
/// The card automatically applies consistent styling including:
/// - Border styling with rounded corners using the design system's border color
/// - Padding and spacing following the ShadcniOS design tokens
/// - Responsive layout that adapts to content size
///
/// The footer buttons are automatically styled:
/// - First button uses `.outline` variant
/// - Second button uses `.default` variant
/// - Both buttons use `.sm` size
///
/// ### Usage
///
/// Basic card with form content:
/// ```swift
/// SHDCard(
///     title: "Create project",
///     description: "Deploy your new project in one-click.",
///     shdBody: VStack {
///         Text("Name")
///             .frame(maxWidth: .infinity, alignment: .leading)
///         TextField("Name of your project", text: $name)
///             .textFieldStyle(.roundedBorder)
///         Text("Framework")
///             .frame(maxWidth: .infinity, alignment: .leading)
///         TextField("Type", text: $type)
///             .textFieldStyle(.roundedBorder)
///     },
///     button1Title: "Cancel",
///     button2Title: "Create"
/// ) {
///     // Cancel action
/// } actionButton2: {
///     // Create action
/// }
/// ```
///
/// Card with custom body content:
/// ```swift
/// SHDCard(
///     title: "Settings",
///     description: "Configure your preferences.",
///     shdBody: VStack {
///         Toggle("Enable notifications", isOn: $notificationsEnabled)
///         Toggle("Dark mode", isOn: $darkMode)
///     },
///     button1Title: "Reset",
///     button2Title: "Save"
/// ) {
///     resetSettings()
/// } actionButton2: {
///     saveSettings()
/// }
/// ```
///
/// ### Notes
/// - The card's body content is left-aligned by default
/// - Both footer buttons are required and will always be displayed
/// - The card uses design system spacing tokens (`.lg`, `.md`) for consistent padding
/// - Border radius follows the design system's medium corner radius (`.md`)
public struct SHDCard<Content: View>: View {

    // MARK: - Properties

    /// The card's title displayed in the header section.
    private var title: String

    /// The descriptive text displayed below the title in the header.
    private var description: String

    /// The custom SwiftUI content displayed in the card's body section.
    private var shdBody: Content

    /// The title text for the first (outline) button in the footer.
    private var button1Title: String

    /// The title text for the second (default) button in the footer.
    private var button2Title: String

    /// The closure executed when the first button is tapped.
    private var actionButton1: () -> Void

    /// The closure executed when the second button is tapped.
    private var actionButton2: () -> Void

    // MARK: - Initializer

    /// Creates a new card with header, body, and footer content.
    ///
    /// - Parameters:
    ///   - title: A short, descriptive heading displayed at the top of the card
    ///   - description: Additional context or information displayed below the title
    ///   - shdBody: The SwiftUI view content displayed in the card's body section
    ///   - button1Title: The text label for the first (outline) footer button
    ///   - button2Title: The text label for the second (default) footer button
    ///   - actionButton1: The closure executed when the first button is tapped
    ///   - actionButton2: The closure executed when the second button is tapped
    public init(
        title: String,
        description: String,
        shdBody: Content,
        button1Title: String,
        button2Title: String,
        actionButton1: @escaping () -> Void,
        actionButton2: @escaping () -> Void
    ) {
        self.title = title
        self.description = description
        self.shdBody = shdBody
        self.button1Title = button1Title
        self.button2Title = button2Title
        self.actionButton1 = actionButton1
        self.actionButton2 = actionButton2
    }

    // MARK: - View

    /// The card's visual representation, composed of header, body, and footer sections.
    public var body: some View {
        VStack {
            SHDCardHeader(title: title, description: description)

            SHDCardBody(shdBody: shdBody)

            SHDCardFooter(
                button1Title: button1Title,
                button2Title: button2Title,
                actionButton1: actionButton1,
                actionButton2: actionButton2
            )
        }
        .padding(.horizontal, .lg)
        .padding(.bottom, .lg)
        .overlay(
            RoundedRectangle(cornerRadius: .md)
                .stroke(
                    SHDColor.borderDefault.color,
                    lineWidth: 1
                )
        )
        .padding()
    }
}

#Preview {
    SHDCardPreview()
}
