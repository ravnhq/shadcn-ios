//
//  CheckboxSize.swift
//  ShadcniOS
//
//  Created by Concepción Orellana on 12/4/25.
//

import Foundation

/// Defines the available size variants for `SHDCheckbox`.
///
/// ## Discussion
/// Each case provides both a control dimension (used for the checkmark square)
/// and a matching text style to keep typography aligned with the design scale.
///
/// ## Usage
/// ```swift
/// SHDCheckbox(label: "Accept")
///     .checkboxStyle(size: .md)
/// ```
public enum SHDCheckboxSize: CGFloat {
    // MARK: - Size Variants
    /// Compact dimensions.
    case sm = 16

    /// Medium checkbox size.
    /// Default size for standard checkbox.
    case md = 20

    /// Large checkbox size.
    case lg = 24

    // MARK: - Typography Mapping
    /// The label text style associated with the checkbox size.
    ///
    /// - Returns: An `SHDTextStyle` representing the correct typography.
    var labelTextStyle: SHDTextStyle {
        switch self {
        case .sm: .textSMMedium
        case .md: .textBaseMedium
        case .lg: .textLGMedium
        }
    }

    // MARK: - Typography Mapping
    /// The description text style associated with the checkbox size.
    ///
    /// - Returns: An `SHDTextStyle` representing the correct typography.
    var descriptionTextSize: SHDTextStyle {
        switch self {
        case .sm: .textSMRegular
        case .md: .textBaseRegular
        case .lg: .textLGRegular
        }
    }
}
