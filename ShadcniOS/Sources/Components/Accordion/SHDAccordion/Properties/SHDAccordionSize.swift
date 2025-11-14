//
//  SHDAccordionSize.swift
//  ShadcniOS
//
//  Created by JoseAlvarez on 11/12/25.
//

import Foundation
import SwiftUI

/// Defines the available size configurations for accordion components
///
/// Each size option specifies corresponding font styles and vertical padding
/// for both the title and content areas of an accordion item
/// This ensures  a consistent visual herarchy and spacing across the component
///
/// Example usage:
/// ```swift
/// Text("Title content")
///     .textStyle(size.titleFont)
/// ```
///
/// The `SHDAccordionSize` is primarily used by `SHDAccordionTextStyle`
/// to apply size-dependent text and layout settings
public enum SHDAccordionSize {
    /// Small accordion size, typically used in compact layouts
    case sm

    /// Medium accordion size, suitable for standard layouts
    case md

    /// large accordion size, used for prominent or detailed accordion view
    case lg

    /// The text style applied to the accordion title based on the selected size
    var titleFont: SHDTextStyle {
        switch self {
        case .sm: .textBaseMedium
        case .md: .textLGMedium
        case .lg: .textXLMedium
        }
    }

    /// The text style applied to the accordion content based on the selected size
    var contentFont: SHDTextStyle {
        switch self {
        case .sm: .textSMRegular
        case .md: .textBaseRegular
        case .lg: .textLGRegular
        }
    }

    /// The vertical spacing applied to the accordion text content and outside
    var verticalSpacing: SHDSizing.Spacing {
        switch self {
        case .sm: .md
        case .md: .lg
        case .lg: .lg
        }
    }
}
