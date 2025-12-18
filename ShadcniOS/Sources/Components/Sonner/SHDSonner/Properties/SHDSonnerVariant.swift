//
//  SHDSonnerVariant.swift
//  ShadcniOS
//
//  Created by Diego Takaki on 12/16/25.
//

import SwiftUI

/// A semantic set of visual variants used to style ShadcniOS toast notifications.
///
/// ## Discussion
/// `SHDSonnerVariant` defines all visual notification styles available in the
/// ShadcniOS design system for toast/sonner components.
///
/// Each variant controls:
/// - icon asset (contextual indicator)
/// - foreground color (applied to the icon)
///
/// All colors and icons are sourced from the ShadcniOS design system token set,
/// ensuring consistent semantic communication across the interface.
///
/// Variants provide contextual meaning:
/// - `.default`: General informational messages
/// - `.success`: Positive confirmations and completed actions
/// - `.warning`: Cautionary messages requiring attention
/// - `.destructive`: Errors or critical issues
///
/// The variant system enables users to quickly identify the nature and urgency
/// of notifications through consistent visual language.
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
public enum SHDSonnerVariant {
    /// The standard informational notification style.
    case `default`

    /// A positive confirmation for successful actions.
    case success

    /// A cautionary notification for warnings or attention-required states.
    case warning

    /// A critical notification for errors or destructive outcomes.
    case destructive

    var icon: SHDIconAsset {
        switch self {
        case .default:
            return .codingDevelopmentTerminal
        case .success:
            return .notificationCircleCheckBig
        case .warning:
            return .triangleAlert
        case .destructive:
            return .notificationCircleAlert
        }
    }

    var foregroundColor: SHDColor {
        switch self {
        case .default:
            return .foregroundDefault
        case .success:
            return .iconSuccessDefault
        case .warning:
            return .iconWarningDefault
        case .destructive:
            return .iconDestructiveDefault
        }
    }
}
