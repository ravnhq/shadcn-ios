//
//  SHDButtonVariant.swift
//  ShadcniOS
//
//  Created by JoseAlvarez on 11/17/25.
//

import SwiftUI

/// A view modifier that applies ShadcniOS button **variant** styling
/// and typography **size** to any SwiftUI view.
///
/// ### Overview
///
/// `SyledSHDButton` centralizes the visual styling logic of a ShadcniOS button.
/// It applies only **two** responsibilities:
///
/// - **Variant (`SHDButtonVariant`)**
///     Controls background, foreground and border colors.
///
/// - **Size (`SHDButtonSize`)**
///     Controls typography through the design system using the
///     `buttonSize` environment key.
///
/// > Important:
/// This modifier **does not** apply interaction states such as loading,
/// pressed, or disabled beyond using `.disabledMask()` if the view
/// is disabled. Those states must be handled elsewhere.
///
///
/// ### Why this modifier?
///
/// SwiftUI does not allow combining multiple `ButtonStyle`s.
/// By using a custom modifier, we provide a unified, composable styling layer
/// that works for:
/// - `Button`
/// - `SHDButton`
/// - Any custom interactive component
///
///
/// ### Usage Examples
///
/// Default button styling:
/// ```swift
/// SHDButton(label: "Continue") { }
///     .buttonVariant()
/// ```
///
/// Custom variant and size:
/// ```swift
/// SHDButton(label: "Cancel") { }
///     .buttonVariant(variant: .secondary, size: .sm)
/// ```
///
/// Destructive variant:
/// ```swift
/// SHDButton(label: "Delete") { }
///     .buttonVariant(variant: .destructive)
/// ```
///
internal struct SyledSHDButton: ViewModifier {

    // MARK: - Properties

    /// The visual variant of the button (background, border, foreground).
    let variant: SHDButtonVariant

    /// Current button size provided by the environment.
    @Environment(\.buttonSize) private var buttonSize

    /// Indicates whether the button is enabled.
    @Environment(\.isEnabled) var isEnabled

    // MARK: - ViewModifier

    /// Applies color, size, corner radius and border styling
    /// based on the ShadcniOS design system.
    func body(content: Content) -> some View {
        content
            .disabledMask() // Masking when disabled
            .padding(.vertical, .xxs)
            .contentShape(Rectangle())
            .backgroundColor(variant.backgroundColor)
            .foregroundColor(variant.foregroundColor)
            .overlay(
                RoundedRectangle(cornerRadius: .lg)
                    .stroke(
                        variant.borderColor.color,
                        lineWidth: variant.borderColor == .clear ? 0 : 1
                    )
            )
            .cornerRadius(.lg)
            .textStyle(buttonSize.textSize)
    }
}

// MARK: - View Extension

public extension View {

    /// Applies unified ShadcniOS button variant and size styling.
    ///
    /// - Parameters:
    ///   - variant: The color and border configuration. Defaults to `.default`.
    ///   - size: The typography size of the button. Defaults to `.md`.
    ///
    /// - Returns: A view styled according to the ShadcniOS design system.
    ///
    /// ### Example
    /// ```swift
    /// SHDButton(label: "Send") { }
    ///     .buttonVariant(variant: .secondary, size: .sm)
    /// ```
    func buttonVariant(
        variant: SHDButtonVariant = .default,
        size: SHDButtonSize = .md
    ) -> some View {
        modifier(
            SyledSHDButton(variant: variant)
        )
        .environment(\.buttonSize, size)
    }
}
