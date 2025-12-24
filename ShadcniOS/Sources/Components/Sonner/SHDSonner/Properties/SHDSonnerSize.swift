//
//  SHDSonnerSize.swift
//  ShadcniOS
//
//  Created by Diego Takaki on 12/15/25.
//

import SwiftUI

/// Size configurations for toast notifications.
/// ## Discussion
///
/// `SHDSonnerSize` provides three standardized size options for sonner notifications,
/// each coordinating typography, icon sizing, and visual hierarchy to create cohesive
/// notification experiences at different scales.
///
/// All sizes use the ShadcniOS design system's typography scale (``SHDTextStyle``)
/// and icon sizing (``SHDIconSize``) to ensure consistent visual relationships.
///
/// ## Usage
///
///
/// ```swift
/// SHDSonnerConfiguration(
///     title: "Draft saved",
///     subtitle: "Last saved at 3:24 PM",
///     size: .sm
/// )
/// ```
public enum SHDSonnerSize: Sendable {
    /// Small notification size for compact and subtle messages.
    case sm

    /// Medium notification size, the default for standard toast messages.
    case md

    /// Large notification size for emphasized, attention-required messages.
    case lg

    var textStyle: SHDTextStyle {
        switch self {
        case .sm: .textSMMedium
        case .md: .textBaseMedium
        case .lg: .textLGMedium
        }
    }

    var captionStyle: SHDTextStyle {
        switch self {
        case .sm: .textSMRegular
        case .md: .textBaseRegular
        case .lg: .textLGRegular
        }
    }

    var iconSize: SHDIconSize {
        switch self {
        case .sm, .md: .lg
        case .lg: .xl
        }
    }
}
