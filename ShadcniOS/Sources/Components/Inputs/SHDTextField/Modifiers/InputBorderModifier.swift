//
//  InputBorderModifier.swift
//  ShadcniOS
//
//  Created by Concepción Orellana on 12/4/25.
//

import SwiftUI

/// Input border modifier that encapsulates the visual border treatment for input components.
///
/// Centralizes the default border, focus border, error border, and spacing between them so input components
/// only handle content and state. Applies design-token corner radius, spacing, and colors. 
internal struct InputBorderModifier: ViewModifier {
    let isFocused: Bool
    let hasError: Bool

    private var innerBorderColor: Color {
        hasError ? .borderDestructiveDefault : .borderDefault
    }

    private var outerBorderColor: Color {
        hasError ? .borderDestructiveDefault : .borderPrimaryDefault
    }

    func body(content: Content) -> some View {
        content
            .overlay(
                RoundedRectangle(cornerRadius: .md)
                    .inset(by: 1)
                    .stroke(innerBorderColor, lineWidth: 1)
            )
            .padding(.all, .xxxs)
            .overlay {
                if isFocused {
                    RoundedRectangle(cornerRadius: .md)
                        .inset(by: 1)
                        .stroke(outerBorderColor, lineWidth: 2)
                }
            }
    }
}

internal extension View {
    /// Applies the ShadcniOS input border style with focus and error state support.
    ///
    /// ## Discussion
    /// Mirrors other design-system helpers (such as `backgroundColor`) to keep styling
    /// centralized and readable. This attaches the custom `InputBorderModifier` so the
    /// default border, focus border, and error border render with the correct spacing and design tokens.
    ///
    /// ## Usage
    /// ```swift
    /// SHDTextField(text: $value, placeholder: "Email")
    ///     .inputBorder(isFocused: isFocused, hasError: hasError)
    /// ```
    ///
    /// - Parameters:
    ///   - isFocused: Whether the input is currently focused, showing the focus border.
    ///   - hasError: Whether the input has an error, showing the destructive border.
    func inputBorder(isFocused: Bool, hasError: Bool = false) -> some View {
        modifier(InputBorderModifier(isFocused: isFocused, hasError: hasError))
    }
}
