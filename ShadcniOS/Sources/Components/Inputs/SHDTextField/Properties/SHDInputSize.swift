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
    var paddingStyle: SHDSizing.Padding {
        switch self {
        case .sm: .xxs
        case .md: .xs
        case .lg: .sm
        }
    }

    /// Icon size for leading/trailing adornments (fixed at 20pt).
    var iconSize: SHDIconSize { .lg }
}
