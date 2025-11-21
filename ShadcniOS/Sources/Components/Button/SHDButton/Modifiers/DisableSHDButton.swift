//
//  DisableSHDButton.swift
//  ShadcniOS
//
//  Created by JoseAlvarez on 11/20/25.
//

import SwiftUI

/// A view modifier that applies a visual disabled state to ShadcniOS buttons.
///
/// ### Overview
/// `SDHDisabledMask` is an internal `ViewModifier` used to indicate when a
/// button is disabled by adjusting the **opacity** of its background mask.
///
/// The modifier:
/// - Reads the `isEnabled` environment value.
/// - Applies a mask using the button's background color from the
///   provided `SHDButtonVariant`.
/// - Reduces opacity to `0.5` when `isEnabled == false`.
/// - Leaves the content fully opaque when enabled.
///
/// This modifier does **not** affect layout, interaction, or text/icon colors.
/// It only applies a visual cue that the button is disabled.
///
/// ### Usage
///
/// Typically used internally by `SHDButton` to indicate disabled state:
/// ```swift
/// SHDButton(label: "Submit") { }
///     .disabledMask()
/// ```
///
/// Custom variant usage:
/// ```swift
/// SHDButton(label: "Delete") { }
///     .disabledMask(variant: .destructive)
/// ```
///
/// ### Notes
/// - The modifier works with **any button content** that has a valid background.
/// - Designed for internal use within the ShadcniOS button system.
internal struct SDHDisabledMask: ViewModifier {

    /// Reads the SwiftUI `isEnabled` environment value.
    @Environment(\.isEnabled) private var isEnabled

    /// The button variant to determine the background color for the mask.
    var variant: SHDButtonVariant = .default

    // MARK: - View

    /// Applies the background mask with reduced opacity if disabled.
    func body(content: Content) -> some View {
        content
            .mask(alignment: .center) {
                variant.backgroundColor
                    .color
                    .opacity(isEnabled ? 1 : 0.5)
            }
    }
}

// MARK: - View Extension

internal extension View {

    /// Applies the disabled mask to a button, reducing opacity when `isEnabled == false`.
    ///
    /// - Returns: A view with a background mask that visually indicates the disabled state.
    ///
    /// ### Example
    /// ```swift
    /// SHDButton(label: "Submit") { }
    ///     .disabledMask()
    /// ```
    func disabledMask() -> some View {
        modifier(SDHDisabledMask())
    }
}
