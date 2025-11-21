//
//  DisableSHDButton.swift
//  ShadcniOS
//
//  Created by JoseAlvarez on 11/20/25.
//

import SwiftUI

/// A view modifier that visually indicates a disabled state for ShadcniOS buttons
/// by applying a white mask with reduced opacity.
///
/// ### Overview
/// `DisabledMask` is an internal `ViewModifier` that reacts to the SwiftUI `isEnabled` environment value.
///
/// ### Usage
/// Attach `.disabledMask()` to any button content to have the mask automatically
/// reflect the enabled/disabled state.
///
/// ```swift
/// SHDButton(label: "Submit") { /* action */ }
///     .disabledMask()
/// ```
///
/// ### Notes
/// - Designed for use within the ShadcniOS button system to maintain visual consistency.
internal struct DisabledMask: ViewModifier {

    /// Reads the SwiftUI `isEnabled` environment value.
    @Environment(\.isEnabled) private var isEnabled

    // MARK: - View

    /// Applies the background mask with reduced opacity if disabled.
    func body(content: Content) -> some View {
        content
            .mask(alignment: .center) {
                Color.white
                    .opacity(isEnabled ? 1 : 0.4)
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
        modifier(DisabledMask())
    }
}
