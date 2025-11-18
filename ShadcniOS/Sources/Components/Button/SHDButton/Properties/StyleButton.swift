//
//  StyleButton.swift
//  ShadcniOS
//
//  Created by JoseAlvarez on 11/17/25.
//

import Foundation

/// Defines the interaction state styles for a button in the ShadcniOS design system.
///
/// ### Discussion
/// `StyleButton` provides a set of predefined visual states that a button can assume
/// to indicate its current status, such as default, loading, or disabled.
/// Each state affects the button’s opacity to communicate availability or activity
/// to the user.
///
/// Opacity values are automatically applied when rendering the button, providing
/// a consistent look across all buttons in the design system.
///
/// ### Usage
///
/// Basic usage:
/// ```swift
/// let state: StyleButton = .buttonDefault
/// someButton
///     .opacity(state.opacity)
/// ```
///
/// Applying a loading style:
/// ```swift
/// let state: StyleButton = .buttonLoading
/// someButton
///     .opacity(state.opacity)
///     .disabled(true)
/// ```
///
/// Applying a disabled style:
/// ```swift
/// let state: StyleButton = .buttonDisable
/// someButton
///     .opacity(state.opacity)
///     .disabled(true)
/// ```
public enum StyleButton {

    // MARK: - States

    /// Default button state. Fully opaque and active.
    case buttonDefault

    /// Loading state. Slightly transparent to indicate activity.
    case buttonLoading

    /// Disabled state. Slightly transparent to indicate unavailability.
    case buttonDisable

    // MARK: - Computed Properties

    /// The opacity value associated with the button state.
    ///
    /// Default buttons are fully opaque. Loading and disabled buttons are semi-transparent.
    public var opacity: CGFloat {
        switch self {
        case .buttonDefault: return 1
        case .buttonLoading: return 0.5
        case .buttonDisable: return 0.5
        }
    }
}

