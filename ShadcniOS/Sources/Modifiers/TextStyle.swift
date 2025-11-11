//
//  TextStyle.swift
//  ShadcniOS
//
//  Created by JoseAlvarez on 11/7/25.
//

import SwiftUI

/// A `ViewModifier` that applies an `SHDTextStyle` to a SwiftUI view.
/// Handles font, weight, size, line spacing, letter spacing, underline, and color.
internal struct TextStyle: ViewModifier {

    /// The text style to apply.
    let style: SHDTextStyle

    func body(content: Content) -> some View {
        content
            .font(
                .custom(
                    style.weight.fontName,  // Uses the postscript name for the font weight
                    size: style.size,
                    relativeTo: style.relativeFont
                )
            )
            .kerning(style.letterSpacing)  // Adjust letter spacing
            .lineSpacing(style.lineHeight)  // Set line height
            .underline(style.underline)  // Apply underline if needed
            .foregroundColor(.foregroundDefault)  // Default text color
    }
}

// MARK: - TextStyle
internal extension View {
    /// Convenience method to apply an `SHDTextStyle` to any view.
    ///
    /// Example:
    /// ```swift
    /// Text("Hello World")
    ///     .textStyle(.h1) // Apply predefined H1 style
    /// ```
    ///
    /// - Parameter style: The `SHDTextStyle` to apply.
    /// - Returns: The view with the specified text style applied.
    func textStyle(_ style: SHDTextStyle) -> some View {
        modifier(TextStyle(style: style))
    }
}
