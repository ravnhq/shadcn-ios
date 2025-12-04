//
//  SHDCardBody.swift
//  ShadcniOS
//
//  Created by JoseAlvarez on 11/27/25.
//

import SwiftUI

/// A container component that wraps and styles the body content of a card.
///
/// ### Discussion
/// `SHDCardBody` provides consistent layout and spacing for the main content area
/// within a card component. It automatically applies:
///
/// - **Full-width layout**: Content spans the full available width with leading alignment
/// - **Consistent spacing**: Bottom padding using the design system's large spacing token (`.lg`)
///
/// This component is used internally by `SHDCard` to ensure consistent body styling
/// across all card implementations. It accepts any SwiftUI view as content, making it
/// flexible for various use cases including forms, lists, text, or custom layouts.
///
/// The component maintains design system consistency by using standardized spacing
/// tokens rather than hardcoded values, ensuring proper alignment with other
/// ShadcniOS components.
///
/// ### Usage
///
/// Basic body with text content:
/// ```swift
/// SHDCardBody(shdBody: VStack {
///     Text("Card Content")
///     Text("Additional information")
/// })
/// ```
///
/// Body with form elements:
/// ```swift
/// SHDCardBody(shdBody: VStack {
///     TextField("Name", text: $name)
///         .textFieldStyle(.roundedBorder)
///     TextField("Email", text: $email)
///         .textFieldStyle(.roundedBorder)
/// })
/// ```
///
/// Body with custom layout:
/// ```swift
/// SHDCardBody(shdBody: HStack {
///     Image(systemName: "star.fill")
///     Text("Featured content")
/// })
/// ```
///
/// ### Notes
/// - Content is automatically left-aligned and spans the full available width
/// - Bottom padding uses the design system's `.lg` spacing token
/// - This component is typically used within `SHDCard` but can be used independently
struct SHDCardBody<Content: View>: View {

    // MARK: - Properties

    /// The SwiftUI view content displayed in the card's body section.
    ///
    /// This can be any SwiftUI view or composition of views, including:
    /// - Text and labels
    /// - Form controls (text fields, toggles, pickers)
    /// - Lists and stacks
    /// - Custom views and layouts
    var shdBody: Content

    // MARK: - View

    /// The body's visual representation, applying consistent layout and spacing.
    ///
    /// The body content is displayed with:
    /// - Full-width frame with leading alignment
    /// - Bottom padding using the design system's large spacing token
    var body: some View {
        shdBody
            .padding(.bottom, .lg)
    }
}
