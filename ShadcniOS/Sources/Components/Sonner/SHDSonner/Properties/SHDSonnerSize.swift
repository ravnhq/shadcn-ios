//
//  SHDSonnerSize.swift
//  ShadcniOS
//
//  Created by Diego Takaki on 12/15/25.
//

import SwiftUI

/// Defines the available size variants for ShadcniOS toast notifications.
///
/// ## Discussion
/// `SHDSonnerSize` standardizes the typography and icon sizing for toast/sonner
/// components in the ShadcniOS design system. Each case corresponds to specific
/// `SHDTextStyle` values for both title and subtitle text, as well as an
/// `SHDIconSize`, ensuring consistent visual hierarchy across different
/// notification sizes.
///
/// Each size provides three coordinated properties:
/// - `textStyle`: Typography for the notification title (medium weight)
/// - `captionStyle`: Typography for the notification subtitle (regular weight)
/// - `iconSize`: Icon dimensions matching the text scale
///
/// Size selection guidelines:
/// - `.sm`: Use for subtle, non-critical notifications in dense interfaces
/// - `.md`: Default size for standard toast messages
/// - `.lg`: Use for prominent notifications requiring immediate attention
///
/// ## Usage
/// ```swift
/// ContentView()
///     .showSonner(
///         title: "Settings saved",
///         caption: "Your preferences have been updated",
///         variant: .success,
///         size: .md,
///         isPresented: $showNotification
///     )
/// ```
public enum SHDSonnerSize {
    /// Small notification size for compact text and icon dimensions.
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
        case .sm: .sm
        case .md: .md
        case .lg: .lg
        }
    }
}
