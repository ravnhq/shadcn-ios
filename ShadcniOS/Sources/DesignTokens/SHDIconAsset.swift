//
//  SHDIconAssets.swift
//  ShadcniOS
//
//  Created by JoseAlvarez on 11/5/25.
//

import SwiftUI

/// A collection of icon assets available in the Shadcn iOS design system.
///
/// ## Discussion
/// Each case represents an icon asset that can be used with `SHDIcon` to display
/// consistent icons throughout the application.
///
/// ## Usage
/// ```swift
/// SHDIcon(.notificationBellRing)
///     .iconSize(.md)
/// ```
public enum SHDIconAsset: String, Codable {
    case arrowChevronDown

    case mathsX

    case codingDevelopmentTerminal

    case cursorLoadingCircle

    case eye
    case eyeOff

    case notificationBellOff
    case notificationBellPlus
    case notificationBellRing
    case notificationCheck
    case notificationCheckCheck
    case notificationCircleAlert
    case notificationCircleCheckBig
}
