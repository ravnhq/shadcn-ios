//
//  SHDSonnerVariant.swift
//  ShadcniOS
//
//  Created by Diego Takaki on 12/16/25.
//

import SwiftUI

/// Semantic visual styles for toast notifications.
///
/// ## Discussion
///
/// `SHDSonnerVariant` provides a set of predefined notification styles that communicate
/// different types of information through consistent visual language. Each variant determines
/// the icon and color scheme used in the notification, helping users quickly understand
/// the nature and urgency of the message.
///
/// ## Usage
///
/// ```swift
/// SHDSonnerConfiguration(
///     title: "New version available",
///     subtitle: "Update now to get the latest features",
///     variant: .default
/// )
/// ```
public enum SHDSonnerVariant: Sendable {
    /// The standard informational notification style.
    case `default`

    /// A positive confirmation style for successful actions.
    case success

    /// A cautionary style for warnings and attention-required states.
    case warning

    /// A critical notification style for errors and destructive outcomes.
    case destructive

    var icon: SHDIconAsset {
        switch self {
        case .default:
            .codingDevelopmentTerminal
        case .success:
            .notificationCircleCheckBig
        case .warning:
            .triangleAlert
        case .destructive:
            .notificationCircleAlert
        }
    }

    var foregroundColor: SHDColor {
        switch self {
        case .default:
            .foregroundDefault
        case .success:
            .iconSuccessDefault
        case .warning:
            .iconWarningDefault
        case .destructive:
            .iconDestructiveDefault
        }
    }
}
