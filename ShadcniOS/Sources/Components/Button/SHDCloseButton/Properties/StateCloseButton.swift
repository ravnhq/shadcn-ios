//
//  StateCloseButton.swift
//  ShadcniOS
//
//  Created by JoseAlvarez on 11/19/25.
//

/// Represents the visual state of a `SHDCloseButton`.
///
/// `StateCloseButton` defines how the close button should be visually
/// interpreted—either in its default appearance or in an error/destructive mode.
///
/// ### Discussion
/// This enum primarily affects the foreground color applied to the close
/// button’s icon. It is consumed by `SHDCloseButtonState` and exposed through the
/// public modifier `closeButtonError(_:)`.
///
/// ### States
/// - `.false`: Default appearance with a muted icon color.
/// - `.true`: Error appearance with a destructive icon color.
///
/// - SeeAlso: ``SHDCloseButtonState``
/// - SeeAlso: ``SHDCloseButton``
public enum StateCloseButton {

    /// Default (non-error) state.
    ///
    /// Displays the icon using a muted color appropriate for standard UI contexts.
    case `false`

    /// Error (destructive) state.
    ///
    /// Displays the icon using a more prominent destructive color to indicate
    /// error or critical dismissal scenarios.
    case `true`

    /// The foreground color associated with the state.
    ///
    /// This value is consumed by `SHDCloseButtonState` when styling a button.
    var foregroundColor: SHDColor {
        switch self {
        case .false: return .iconMuted
        case .true: return .iconDestructiveOnDestructive
        }
    }
}
