//
//  SHDIconSize.swift
//  ShadcniOS
//
//  Created by JoseAlvarez on 11/5/25.
//

import Foundation

/// A scale enumeration that defines the standard icon sizes used across the Shadcn iOS design system.
///
/// `SHDIconSize` provides a set of predefined values for consistent icon sizing throughout the app.
/// These values are aligned with the design tokens and ensure visual consistency between components.
///
internal enum SHDIconSize: CGFloat {
    /// Small icon size (12pt) — typically used for compact UI elements or within text.
    case sm = 12

    /// Medium icon size (16pt) — the default icon size for most components elements.
    case md = 16

    /// Large icon size (20pt) — used for prominent icons or touch targets.
    case lg = 20
}
