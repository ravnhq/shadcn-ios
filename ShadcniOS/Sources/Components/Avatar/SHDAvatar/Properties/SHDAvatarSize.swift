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
/// SHDAvatarIcon(icon: .notificationCheckCheck)
///     .iconSize(size)
///     .frame(width: size.size, height: size.size)
/// ```
public enum SHDAvatarSize {
    case sm
    case md
    case lg

    /// Square dimension of the avatar container, expressed in points.
    ///
    /// ## Discussion
    /// Apply this value to both the width and height of the avatar so the
    /// surface remains perfectly round and proportioned for the chosen size.
    ///
    /// ## Usage
    /// ```swift
    /// SHDAvatarInitials(text: "RM")
    ///     .avatarVariant(variant: .light, size: size)
    ///     .frame(width: size.size, height: size.size)
    /// ```
    var size: CGFloat {
        switch self {
        case .sm: 24
        case .md: 36
        case .lg: 56
        }
    }

    /// Padding between the avatar boundary and its loaded image content.
    ///
    /// ## Discussion
    /// Use this to inset user-uploaded images so they do not touch the edge of
    /// the container, preserving the intended breathing room.
    ///
    /// ## Usage
    /// ```swift
    /// SHDAvatarImage(image: Image("imageFromAssets"))
    ///     .imagePadding(size)
    /// ```
    var imagePadding: CGFloat {
        switch self {
        case .sm: 4
        case .md: 8
        case .lg: 16
        }
    }

    /// Appropriate `SHDIconSize` for fallback or decorative icons.
    ///
    /// ## Discussion
    /// When the avatar renders an icon instead of an image, reference this
    /// value to match the icon scale with the surrounding container.
    ///
    /// ## Usage
    /// ```swift
    /// SHDIcon(.notificationBellRing)
    ///     .iconSize(size.iconSize)
    /// ```
    var iconSize: SHDIconSize {
        switch self {
        case .sm: .sm
        case .md: .md
        case .lg: .lg
        }
    }

    /// Text style applied to monogram or initials-based avatars.
    ///
    /// ## Discussion
    /// Pair this with the typography API (e.g., `textStyle`) to ensure the
    /// characters inside the avatar align with the design spec.
    ///
    /// ## Usage
    /// ```swift
    /// SHDAvatarInitials(text: "AM", size: size)
    ///     .textStyle(size.textStyle)
    /// ```
    var textStyle: SHDTextStyle {
        switch self {
        case .sm: .textXSSemibold
        case .md: .textBaseSemibold
        case .lg: .text3XLSemibold
        }
    }

    /// Horizontal and vertical padding for text-based avatars.
    ///
    /// ## Discussion
    /// Helps center initials or short labels within the avatar while preventing
    /// the glyphs from touching the edge of the circle.
    ///
    /// ## Usage
    /// ```swift
    /// SHDAvatarInitials(text: "AM", size: size)
    ///     .padding(size.textPadding)
    /// ```
    var textPadding: CGFloat {
        switch self {
        case .sm: 3
        case .md: 6
        case .lg: 9
        }
    }
}
