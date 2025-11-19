//
//  SHDCloseButtonState.swift
//  ShadcniOS
//
//  Created by JoseAlvarez on 11/19/25.
//

import SwiftUI

/// A button style that visually updates a close button based on its state.
///
/// `SHDCloseButtonState` applies a foreground color derived from
/// ``StateCloseButton`` to the button's content. Although designed for
/// ``SHDCloseButton``, this style can be applied to any SwiftUI `Button`
/// whose label supports foreground styling.
///
/// ### Discussion
/// This style is most commonly applied via the `closeButtonError(_:)` view
/// modifier rather than used directly.
///
/// - Note: This style only affects foreground color. Layout, padding, and
///   interaction behavior remain unchanged.
///
struct SHDCloseButtonState: ButtonStyle {

    /// Visual state that determines the color applied to the button’s content.
    var state: StateCloseButton = .false

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(state.foregroundColor)
    }
}


public extension View {

    /// Styles the view using the `SHDCloseButtonState` button style.
    ///
    /// Use this modifier to visually mark a close button as being in an error
    /// or destructive context. This updates only the icon's foreground color.
    ///
    /// ### Parameters
    /// - state: The desired visual state for the close button.
    ///
    /// ### Returns
    /// A view styled according to the provided state.
    ///
    /// ### Usage
    /// Basic usage:
    /// ```swift
    /// SHDCloseButton()
    ///     .closeButtonError(.true)
    /// ```
    ///
    /// Default (non-error):
    /// ```swift
    /// SHDCloseButton()
    ///     .closeButtonError(.false)
    /// ```
    ///
    public func closeButtonError(_ state: StateCloseButton) -> some View {
        buttonStyle(SHDCloseButtonState(state: state))
    }
}
