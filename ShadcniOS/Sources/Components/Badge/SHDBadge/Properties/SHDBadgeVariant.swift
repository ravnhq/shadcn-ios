//
//  SHDBadgeVariant.swift
//  ShadcniOS
//
//  Created by JoseAlvarez on 11/26/25.
//

/// Represents the visual style of `SHDBadge`, mapping each variant to its
/// foreground, background, and border color tokens.
///
/// ### Discussion
/// `SHDBadgeVariant` centralizes the badge design decisions so the component
/// can stay lightweight. Each case corresponds to a pre-defined semantic
/// palette entry that aligns with the design system. Use variants to reinforce
/// hierarchy (for example, `secondary`) or to convey urgency (`destructive`)
/// without duplicating color logic across call sites.
///
/// ### Usage
/// ```swift
/// let badge = SHDBadge(text: "New", variant: .secondary)
/// // Automatically applies the secondary palette tokens.
/// ```
public enum SHDBadgeVariant {
    /// Default badge appearance intended for primary emphasis.
    case `default`

    /// Softer treatment for secondary or supporting information.
    case secondary

    /// Minimal badge with transparent background and visible border.
    case outline

    /// High-alert appearance that leverages the destructive palette.
    case destructive

    /// Primary text/icon color token that corresponds to the variant.
    ///
    /// ### Discussion
    /// Returns semantic colors that ensure legible contrast for the selected
    /// variant. Values are sourced from `SHDColor` so consumers do not need to
    /// manually pick palette entries.
    var foregroundColor: SHDColor {
        switch self {
        case .default: .foregroundPrimaryDefault
        case .secondary: .foregroundSecondaryDefault
        case .outline:.foregroundDefault
        case .destructive: .white
        }
    }

    /// Background fill token that balances the foreground selection.
    ///
    /// ### Discussion
    /// The colors reinforce the semantic intent of the badge (for example,
    /// `.outline` remains transparent, while `.destructive` uses the warning
    /// palette).
    var backgroundColor: SHDColor {
        switch self {
        case .default: .backgroundPrimaryDefault
        case .secondary: .backgroundSecondaryDefault
        case .outline: .clear
        case .destructive: .backgroundDestructiveDefault
        }
    }

    /// Thin border color applied when the variant requires extra delineation.
    ///
    /// ### Discussion
    /// Currently only `.outline` uses a visible border; all other variants
    /// default to `.clear` to avoid double strokes around the badge capsule.
    var borderColor: SHDColor {
        switch self {
        case .outline: .borderDefault
        default: .clear
        }
    }
}
