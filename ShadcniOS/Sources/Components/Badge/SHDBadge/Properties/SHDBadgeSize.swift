//
//  SHDBadgeSize.swift
//  ShadcniOS
//
//  Created by JoseAlvarez on 11/26/25.
//

/// Describes the supported sizes for `SHDBadge`.
///
/// ## Discussion
/// Each size bundles typography and spacing choices so badges
/// stay aligned with Shade design tokens. Sizes control both the text style
/// and horizontal padding, ensuring consistent visual hierarchy across
/// different badge sizes. Use with `badgeStyle(size:variant:)` to adjust
/// emphasis or density without manual tuning.
///
/// ## Usage
/// ```swift
/// SHDBadge(text: "Beta")
///     .badgeStyle(size: .sm)
/// ```
public enum SHDBadgeSize {

    // MARK: - Size Variants

    /// Small badge for dense layouts or compact labels.
    case sm

    /// Default badge size that balances readability and space.
    case md

    /// Large badge for prominent labels or standalone status.
    case lg

    var textStyle: SHDTextStyle {
        switch self {
        case .sm: .textXSSemibold
        case .md: .textSMSemibold
        case .lg: .textBaseSemibold
        }
    }

    var horizontalPadding: SHDSizing.Padding {
        switch self {
        case .sm: .xs
        case .md: .sm
        case .lg: .md
        }
    }
}
