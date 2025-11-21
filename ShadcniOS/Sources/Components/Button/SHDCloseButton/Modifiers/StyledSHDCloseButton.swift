//
//  SHDCloseButtonState.swift
//  ShadcniOS
//
//  Created by JoseAlvarez on 11/19/25.
//

import SwiftUI

/// A lightweight `ButtonStyle` used to visually differentiate close buttons
/// when they represent an error state.
///
/// ### Overview
/// `StyledSHDCloseButton` updates the **foreground color** of a button based on
/// whether the view is marked as an error.
///
/// It is designed primarily for `SHDCloseButton`, but can be applied to **any**
/// SwiftUI `Button` whose label supports foreground styling.
///
/// This style intentionally keeps behavior minimal:
/// - no background changes
/// - no layout modifications
/// - no animations
///
/// Only the color changes based on the `isError` flag.
///
/// ### Visual Rules
///
/// - `isError == true` → `.iconDestructiveOnDestructive`
/// - `isError == false` → `.iconMuted`
///
/// These values map to ShadcniOS design tokens.
///
/// ### Usage Examples
///
/// Error state:
/// ```swift
/// SHDCloseButton()
///     .errorStyle(true)
/// ```
///
/// Non-error state:
/// ```swift
/// SHDCloseButton()
///     .errorStyle(false)
/// ```
///
/// Used on a vanilla Button:
/// ```swift
/// Button("Close") { }
///     .errorStyle(true)
/// ```
internal struct StyledSHDCloseButton: ButtonStyle {

    /// Whether the button should visually appear in an error state.
    let isError: Bool

    /// Builds the styled button view.
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(
                isError
                ? .iconDestructiveOnDestructive
                : .iconMuted
            )
    }
}

// MARK: - View Extension

public extension View {

    /// Applies the ShadcniOS close-button error style.
    ///
    /// - Parameter isError: Whether the button should appear in an error state.
    ///
    /// - Returns: A button styled according to `isError`.
    ///
    /// ### Example
    /// ```swift
    /// SHDCloseButton()
    ///     .errorStyle(true)
    /// ```
    func errorStyle(_ isError: Bool) -> some View {
        buttonStyle(StyledSHDCloseButton(isError: isError))
    }
}
