//
//  SHDButtonVariant.swift
//  ShadcniOS
//
//  Created by JoseAlvarez on 11/17/25.
//

import SwiftUI

/// A unified view modifier that applies **variant**, **state**, and **size**
/// visual styling to any SHD button.
///
/// ### Discussion
///
/// `SHDButtonModifier` centralizes the styling logic of ShadcniOS buttons into a
/// single, cohesive modifier. Instead of applying multiple modifiers
/// (`shdButtonSize`, `shdButtonStyle`, `buttonVariant`), this unified modifier
/// handles all visual concerns:
///
/// - **Variant (`SHDVariantButton`)**
///     - Background color
///     - Foreground (text/icon) color
///     - Border color and corner radius
///
/// - **State (`SHDStyleButton`)**
///     - Opacity (default, loading, disabled)
///
/// - **Size (`SHDSizeButton`)**
///     - Typography size through the design system’s `SHDTextStyle`
///
///
/// ### Why a unified modifier?
///
/// This approach provides consistent, predictable styling and removes the need
/// to combine incompatible SwiftUI modifiers like multiple `ButtonStyle`s.
///
///
/// ### Usage
///
/// Applying a default button:
/// ```swift
/// SHDButton(label: "Continue") {
///     print("Button tapped")
/// }
/// .shdButton()
/// ```
///
/// Applying a variant + size:
/// ```swift
/// SHDButton(label: "Cancel") { }
///     .shdButton(variant: .secondary, size: .sm)
/// ```
///
/// Applying all parameters explicitly:
/// ```swift
/// SHDButton(label: "Delete") { }
///     .shdButton(variant: .destructive, style: .buttonDisable, size: .lg)
/// ```
///
struct SHDButtonModifier: ViewModifier {

    // MARK: - Properties

    /// The visual variant of the button (background, borders, foreground).
    let variant: SHDVariantButton

    /// The interaction state (default, loading, disabled).
    let style: SHDStyleButton

    /// The size of the button (controls typography).
    let size: SHDSizeButton

    // MARK: - ViewModifier

    /// Applies size, opacity, background, colors, and borders to the content.
    ///
    /// - Parameter content: The SwiftUI view representing the button.
    /// - Returns: A fully styled ShadcniOS button.
    func body(content: Content) -> some View {
        content
            .padding(.vertical, .xxs)
            .contentShape(Rectangle())
            .backgroundColor(variant.backgroundColor)
            .foregroundColor(variant.foregroundColor)
            .overlay(
                RoundedRectangle(cornerRadius: .lg)
                    .stroke(variant.borderColor.color, lineWidth: variant.borderColor == .clear ? 0 : 1)
            )
            .cornerRadius(.lg)
            .textStyle(size.textSize)
            .opacity(style.opacity)
    }
}

// MARK: - View Extension

public extension View {

    /// Applies unified ShadcniOS button styling to the view.
    ///
    /// - Parameters:
    ///   - variant: The design variant of the button (colors, border, etc.). Defaults to `.default`.
    ///   - style: The interaction state of the button
    ///   (default, loading, disabled). Defaults to `.buttonDefault`.
    ///   - size: The size of the button (typography). Defaults to `.md`.
    ///
    /// - Returns: A fully styled button using the ShadcniOS design system.
    ///
    /// ### Example
    /// ```swift
    /// SHDButton(label: "Send") {
    ///     viewModel.sendMessage()
    /// }
    /// .shdButton(variant: .secondary, style: .buttonLoading, size: .sm)
    /// ```
    func buttonVariant(
        variant: SHDVariantButton = .default,
        style: SHDStyleButton = .buttonDefault,
        size: SHDSizeButton = .md
    ) -> some View {
        modifier(SHDButtonModifier(
            variant: variant,
            style: style,
            size: size
        ))
    }
}
