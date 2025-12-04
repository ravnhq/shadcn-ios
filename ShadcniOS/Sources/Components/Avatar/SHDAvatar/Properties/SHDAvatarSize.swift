//
//  SHDAvatarSize.swift
//  ShadcniOS
//
//  Created by JoseAlvarez on 11/25/25.
//

import Foundation

/// Encapsulates the sizing tokens available to `SHDAvatar`.
///
/// ## Discussion
/// The enum centralizes every measurement that an avatar uses—container
/// dimensions, text styles, and the padding applied to images or icons. Using
/// these presets keeps avatars visually consistent across the design system.
///
/// ## Usage
/// ```swift
/// let size: SHDAvatarSize = .md
/// SHDAvatar(icon: .notificationCheckCheck)
///     .avatarStyle(size: size)
/// ```
public enum SHDAvatarSize {
    
    /// small size for avatar component (24 px)
    case sm
    /// Medium size for avatar component (36 px)
    case md
    /// Large size for avatar component (56 px)
    case lg

    var size: CGFloat {
        switch self {
        case .sm: 24
        case .md: 36
        case .lg: 56
        }
    }

    var imagePadding: CGFloat {
        switch self {
        case .sm: 4
        case .md: 8
        case .lg: 16
        }
    }

    var iconSize: SHDIconSize {
        switch self {
        case .sm: .sm
        case .md: .md
        case .lg: .lg
        }
    }

    var textStyle: SHDTextStyle {
        switch self {
        case .sm: .textXSSemibold
        case .md: .textBaseSemibold
        case .lg: .text3XLSemibold
        }
    }

    var textPadding: CGFloat {
        switch self {
        case .sm: 3
        case .md: 6
        case .lg: 9
        }
    }
}
