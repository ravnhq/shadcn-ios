//
//  CheckboxSize.swift
//  ShadcniOS
//
//  Created by Concepción Orellana on 12/4/25.
//

import Foundation

public enum CheckboxSize: CGFloat {
    // MARK: - Size Variants
    /// Compact dimensions.
    case sm = 16

    /// Medium checkbox size.
    /// Default size for standard checkbox.
    case md = 20

    /// Large checkbox size.
    case lg = 24

    // MARK: - Typography Mapping

    /// The text style associated with the checkbox size.
    ///
    /// - Returns: An `SHDTextStyle` representing the correct typography.
    var textSize: SHDTextStyle {
        switch self {
        case .sm: .textSMMedium
        case .md: .textBaseMedium
        case .lg: .textLGMedium
        }
    }
}
