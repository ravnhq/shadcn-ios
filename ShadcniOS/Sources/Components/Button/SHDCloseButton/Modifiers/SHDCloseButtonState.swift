//
//  SHDCloseButtonState.swift
//  ShadcniOS
//
//  Created by JoseAlvarez on 11/19/25.
//

import SwiftUI

/// A button style that visually updates a close button based on an error flag.
///
/// `SHDCloseButtonState` applies a foreground color depending on whether the
/// button is in an error state. Although designed for ``SHDCloseButton``,
/// this style can be applied to any SwiftUI `Button` whose label supports
/// foreground color styling.
///
/// ### Discussion
/// The styling rule is simple:
/// - `isError == true` → error foreground color (typically red)
/// - `isError == false` → default foreground color
///
/// This modifier is primarily accessed via `.closeButtonError(_:)`.
///
/// - Note: This style **only** affects foreground color. Layout and padding
///   are unchanged.
///
struct SHDCloseButtonState: ButtonStyle {

    /// Whether the close button is visually marked as an error.
    let isError: Bool

    /// Builds the button view applying the appropriate foreground color.
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(isError ? .iconDestructiveOnDestructive : .iconMuted)
    }
}

// MARK: - View Extension

public extension View {

    /// Applies the `SHDCloseButtonState` button style using a boolean flag.
    ///
    /// - Parameter isError: A Boolean value indicating whether the close
    ///   button should appear in an error state.
    ///
    /// - Returns: A view styled according to the error state.
    ///
    /// ### Usage
    ///
    /// Error state:
    /// ```swift
    /// SHDCloseButton()
    ///     .closeButtonError(true)
    /// ```
    ///
    /// Default (non-error):
    /// ```swift
    /// SHDCloseButton()
    ///     .closeButtonError(false)
    /// ```
    ///
    func closeButtonError(_ isError: Bool) -> some View {
        buttonStyle(SHDCloseButtonState(isError: isError))
    }
}
