//
//  SHDBadgeSize.swift
//  ShadcniOS
//
//  Created by JoseAlvarez on 11/26/25.
//

/// - Description: Describes the supported sizes for `SHDBadge`.
/// - Discussion: Each size bundles typography and spacing choices so badges
///   stay aligned with Shade design tokens. Use with `badgeStyle(size:variant:)`
///   to adjust emphasis or density without manual tuning.
/// - Usage:
///   ```swift
///   SHDBadge(text: "Beta")
///       .badgeStyle(size: .sm)
///   ```
public enum SHDBadgeSize {

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
}
