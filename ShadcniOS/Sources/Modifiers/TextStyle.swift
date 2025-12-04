//
//  TextStyle.swift
//  ShadcniOS
//
//  Created by JoseAlvarez on 11/7/25.
//

import SwiftUI

/// A `ViewModifier` that applies an `SHDTextStyle` to a SwiftUI view.
///
/// ## Discussion
/// Handles font, weight, size, line spacing, letter spacing, underline, and color.
internal struct TextStyle: ViewModifier {

    /// The text style to apply.
    let style: SHDTextStyle

    func body(content: Content) -> some View {
        content
            .font(
                .custom(
                    style.font.fontName,  // Uses the postscript name for the font weight
                    size: style.size,
                    relativeTo: style.relativeFont
                )
            )
            .kerning(style.letterSpacing)  // Adjust letter spacing
            .underline(style.underline)  // Apply underline if needed
    }
}

// MARK: - TextStyle
internal extension View {
    /// Convenience method to apply an `SHDTextStyle` to any view.
    ///
    /// ## Usage
    /// ```swift
    /// Text("Hello World")
    ///     .textStyle(.h1) // Apply predefined H1 style
    /// ```
    ///
    /// - Parameters:
    ///   - style: The `SHDTextStyle` to apply.
    /// - Returns: The view with the specified text style applied.
    func textStyle(_ style: SHDTextStyle) -> some View {
        modifier(TextStyle(style: style))
    }
}
