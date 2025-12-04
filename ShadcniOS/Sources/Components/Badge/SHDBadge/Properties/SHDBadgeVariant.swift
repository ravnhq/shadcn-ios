//
//  SHDBadgeVariant.swift
//  ShadcniOS
//
//  Created by JoseAlvarez on 11/26/25.
//

/// Represents the visual style of `SHDBadge`, mapping each variant to its
/// foreground, background, and border color tokens.
///
/// ## Discussion
/// Each case maps to a semantic color palette used by the Shade
/// design system. Use variants to distinguish hierarchy or call out status
/// without hard-coding colors.
///
/// ## Usage
/// ```swift
/// SHDBadge(text: "New")
///     .badgeStyle(variant: .secondary)
/// ```
public enum SHDBadgeVariant {
    /// Default badge style for primary emphasis.
    case `default`

    /// Secondary style for supporting information.
    case secondary

    /// Outline style with a transparent background and visible border.
    case outline

    /// Destructive style for errors or critical states.
    case destructive

    var foregroundColor: SHDColor {
        switch self {
        case .default: .foregroundPrimaryDefault
        case .secondary: .foregroundSecondaryDefault
        case .outline:.foregroundDefault
        case .destructive: .white
        }
    }

    var backgroundColor: SHDColor {
        switch self {
        case .default: .backgroundPrimaryDefault
        case .secondary: .backgroundSecondaryDefault
        case .outline: .clear
        case .destructive: .backgroundDestructiveDefault
        }
    }

    var borderColor: SHDColor {
        switch self {
        case .outline: .borderDefault
        default: .clear
        }
    }
}
