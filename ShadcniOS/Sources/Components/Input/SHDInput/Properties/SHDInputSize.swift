//
//  SHDInputSize.swift
//  ShadcniOS
//
//  Created by Diego Takaki on 12/8/25.
//

import SwiftUI

/// Defines the size variants for `SHDInput`.
///
/// ## Discussion
/// `SHDInputSize` standardizes the typography and icon sizing for input fields
/// in the ShadcniOS design system. Each case corresponds to a specific
/// `SHDTextStyle` and `SHDIconSize`, ensuring consistent visual hierarchy
/// across different input sizes.
///
/// These values are used in conjunction with the `inputVariant` modifier to
/// control both the visual appearance and dimensions of input fields, providing
/// a cohesive user experience throughout the application.
///
/// ## Usage
///
/// Getting the text style for a size:
/// ```swift
/// let size: SHDInputSize = .md
/// let style = size.textSize
/// ```
///
/// Applying the size in a SHDInput:
/// ```swift
/// SHDInput(
///     text: $searchText,
///     label: "Search",
///     placeholder: "Type to search..."
/// )
/// .inputVariant(variant: .default, size: .sm)
/// ```
public enum SHDInputSize {

    /// Small input size.
    case sm

    /// Medium input size (default).
    case md

    /// Large input size.
    case lg

    var textSize: SHDTextStyle {
        switch self {
        case .sm: .textSMMedium
        case .md: .textBaseMedium
        case .lg: .textLGMedium
        }
    }

    var iconSize: SHDIconSize {
        switch self {
        case .sm: .sm
        case .md: .md
        case .lg: .lg
        }
    }
}
