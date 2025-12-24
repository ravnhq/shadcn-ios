//
//  SHDInputSize.swift
//  ShadcniOS
//
//  Created by Concepción Orellana on 12/4/25.
//

import SwiftUI

/// Defines the available size variants for `SHDTextInput`.
///
/// ## Discussion
/// Each size sets text styling, control height, and icon sizing to keep inputs
/// consistent across variants.
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
