//
//  SHDAccordionSize.swift
//  ShadcniOS
//
//  Created by JoseAlvarez on 11/12/25.
//

import Foundation
import SwiftUI

/// Defines the available size configurations for accordion components.
///
/// ## Discussion
/// Each size option specifies corresponding font styles and vertical padding
/// for both the title and content areas of an accordion item.
/// This ensures a consistent visual hierarchy and spacing across the component.
///
/// The `SHDAccordionSize` is primarily used by `SHDAccordion`
/// to apply size-dependent text and layout settings using its computed properties.
///
/// ## Usage
/// ```swift
/// Text("Title content")
///     .textStyle(size.titleTextStyle)
/// ```
public enum SHDAccordionSize {
    /// Small accordion size, typically used in compact layouts
    case sm

    /// Medium accordion size, suitable for standard layouts
    case md

    /// large accordion size, used for prominent or detailed accordion view
    case lg

    var titleTextStyle: SHDTextStyle {
        switch self {
        case .sm: .textBaseMedium
        case .md: .textLGMedium
        case .lg: .textXLMedium
        }
    }

    var contentTextStyle: SHDTextStyle {
        switch self {
        case .sm: .textSMRegular
        case .md: .textBaseRegular
        case .lg: .textLGRegular
        }
    }

    var verticalSpacing: SHDSizing.Spacing {
        switch self {
        case .sm: .md
        case .md: .lg
        case .lg: .lg
        }
    }
}
