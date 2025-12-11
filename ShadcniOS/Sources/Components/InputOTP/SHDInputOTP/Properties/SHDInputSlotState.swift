//
//  SHDInputSlotState.swift
//  ShadcniOS
//
//  Created by JoseAlvarez on 12/9/25.
//

import SwiftUI

/// Defines the visual state of an individual OTP input slot.
///
/// ## Discussion
///
/// `SHDInputSlotState` represents three distinct visual states that provide feedback about
/// an OTP field's interaction status and validation state:
///
/// - `Idle`: Default state when the field is not focused and has no errors. Uses standard border styling.
/// - `Focused`: Active state when the field has keyboard focus.
///     Uses primary color border with increased width.
/// - `Error`: Validation failed state. Uses destructive color border to indicate input error.
///
/// The state determines border color, border width, and z-index stacking to provide clear visual
/// feedback about field status and focus. When a field is focused, it displays a thicker border and
/// higher z-index to appear above adjacent fields.
///
/// ## Usage
///
/// ```swift
///
/// // Result: Error state (red border) if isError is true, regardless of focus
/// // Result: Focused state (gray border, 2pt width) if focused and no error
/// // Result: Idle state (gray border, 1pt width) if not focused and no error
/// ```
///
public enum SHDInputSlotState {
    /// The default idle state when the field is not focused and has no validation errors.
    case idle

    /// The active focused state when the field has keyboard focus.
    case focused

    /// The error state when the field has validation errors.
    case error

    var borderColor: SHDColor {
        switch self {
        case .focused: .borderPrimaryDefault
        case .error: .borderDestructiveDefault
        case .idle: .borderDefault
        }
    }

    var borderWidth: CGFloat {
        switch self {
        case .focused: 2
        default: 1
        }
    }

    var zIndex: Double {
        switch self {
        case .focused: return 1
        default: return 0
        }
    }

    static func currentState(isFocused: Bool, isError: Bool) -> SHDInputSlotState {
        if isFocused { return .focused }
        if isError { return .error }
        return .idle
    }
}
