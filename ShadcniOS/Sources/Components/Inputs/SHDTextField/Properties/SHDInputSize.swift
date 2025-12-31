//
//  SHDInputSize.swift
//  ShadcniOS
//
//  Created by Concepción Orellana on 12/4/25.
//

import SwiftUI

/// Defines the available size variants for `SHDTextField`.
///
/// ## Discussion
/// Each size sets text styling, control height, and icon sizing to keep inputs
/// consistent across variants. Use together with `.inputStyle(_:)` to mirror the
/// sizing approach used by other components like `SHDCheckbox`.
public enum SHDInputSize {
    /// Small input height.
    case sm
    /// Medium input height — default.
    case md
    /// Large input height.
    case lg

    /// Typography used for the input text and placeholder.
    ///
    /// - Returns: The design-token text style for this size.
    var textStyle: SHDTextStyle {
        switch self {
        case .sm: .textSMRegular
        case .md: .textBaseRegular
        case .lg: .textLGRegular
        }
    }

    /// Vertical padding used inside the field.
    var paddingStyle: CGFloat {
        let padding: SHDSizing.Padding = switch self {
        case .sm: .xxs
        case .md: .xs
        case .lg: .sm
        }

        return padding.value
    }

    /// Icon size for leading/trailing adornments (fixed at 20pt).
    var iconSize: SHDIconSize { .lg }
}

internal extension View {
    /// Sets the secure field state for the current view hierarchy.
    ///
    /// ## Discussion
    /// This allows text fields to switch between regular text input and secure
    /// password input with a visibility toggle.
    ///
    /// When `isSecureField == true`:
    /// - The text field displays a SecureField by default.
    /// - An eye/eye-off toggle icon appears to show/hide the password.
    ///
    /// ## Usage
    /// ```swift
    /// SHDTextField(placeholder: "Password", text: $password)
    ///     .isSecureField(true)
    /// ```
    ///
    /// - Parameters:
    ///   - isSecureField: A Boolean value indicating whether the field is a secure field.
    /// - Returns: A view with the updated `isSecureField` environment value.
    public func isSecureField(_ isSecureField: Bool) -> some View {
        environment(\.isSecureField, isSecureField)
    }
}
