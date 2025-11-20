//
//  SHDButtonVariant.swift
//  ShadcniOS
//
//  Created by JoseAlvarez on 11/17/25.
//

import SwiftUI

/// A button style that applies a visual variant to `SHDButton` based on `VariantButton`.
///
/// ### Discussion
/// `SHDButtonVariantStyle` allows buttons to adopt consistent background, foreground,
/// and border colors according to the variant defined in the ShadcniOS design system.
///
/// This style handles:
/// - Background color
/// - Foreground color (text and icons)
/// - Border color and corner radius
///
/// Use the `buttonVariant(_:)` view modifier to easily apply a variant to any SwiftUI button.
///
/// ### Usage
///
/// Basic usage with a default variant:
/// ```swift
/// SHDButton(label: "Continue") {
///     print("Button tapped")
/// }
/// .buttonVariant(.default)
/// ```
///
/// Using a destructive variant:
/// ```swift
/// SHDButton(label: "Delete", icon: .trash) {
///     viewModel.deleteItem()
/// }
/// .buttonVariant(.destructive)
/// ```
struct SHDButtonVariantStyle: ButtonStyle {

    // MARK: - Properties

    /// The variant to apply to the button.
    let variant: SHDVariantButton

    // MARK: - ButtonStyle

    /// Builds the visual representation of the button.
    ///
    /// Applies background, foreground, and border styles according to the variant.
    /// Also adds vertical padding and corner radius.
    ///
    /// - Parameter configuration: The button configuration provided by SwiftUI.
    /// - Returns: A view styled according to the selected variant.
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(.vertical, .xxs)
            .contentShape(Rectangle())
            .backgroundColor(variant.backgroundColor)
            .foregroundColor(variant.foregroundColor)
            .overlay(
                RoundedRectangle(cornerRadius: .lg)
                    .stroke(variant.borderColor.color, lineWidth: variant.borderColor == .clear ? 0 : 1)
            )
            .cornerRadius(.lg)
    }
}

// MARK: - View Extension

public extension View {

    /// Applies a `VariantButton` style to any SwiftUI button.
    ///
    /// - Parameter variant: The `VariantButton` variant to apply.
    /// - Returns: A view modified with the corresponding button style.
    ///
    /// ### Example
    /// ```swift
    /// SHDButton(label: "Continue") {
    ///     print("Button tapped")
    /// }
    /// .buttonVariant(.default)
    /// ```
    func buttonVariant(_ variant: SHDVariantButton) -> some View {
        buttonStyle(SHDButtonVariantStyle(variant: variant))
    }
}
