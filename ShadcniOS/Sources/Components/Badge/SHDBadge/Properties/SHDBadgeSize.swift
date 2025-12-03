//
//  SHDBadgeSize.swift
//  ShadcniOS
//
//  Created by JoseAlvarez on 11/26/25.
//

/// Represents the sizing tokens that `SHDBadge` supports to stay aligned with Shade design standards.
///
/// ## Discussion
/// `SHDBadgeSize` aggregates the typography and spacing choices that accompany each badge size.
/// Use these values whenever you need to configure badges manually or inside custom modifiers so the
/// result stays visually consistent with the system component.
///
/// ## Usage
/// ```swift
/// SHDBadge(text: "Beta").shdBadgeStyle(size: .sm)
/// ```
public enum SHDBadgeSize {

    /// Condensed badge suited for dense interfaces and micro labels.
    case sm

    /// Default badge that balances readability and compact layout.
    case md

    /// Spacious badge that pairs well with headlines or standalone status displays.
    case lg

    /// Returns the Shade typography token that matches the current size.
    ///
    /// - Discussion: While this property is primarily used internally by the badge configuration
    ///     modifier, you can reference it to align custom `Text` views with badge typography.
    var textStyle: SHDTextStyle {
        switch self {
        case .sm: .textXSSemibold
        case .md: .textSMSemibold
        case .lg: .textBaseSemibold
        }
    }
}
