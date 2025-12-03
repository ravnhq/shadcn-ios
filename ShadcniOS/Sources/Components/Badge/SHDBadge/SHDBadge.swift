//
//  SHDBadge.swift
//  ShadcniOS
//
//  Created by JoseAlvarez on 11/26/25.
//

import SwiftUI

/// A configurable label-style badge that renders short status text using the Shade design tokens.
///
/// ## Discussion
/// `SHDBadge` encapsulates the padding, typography, and color rules
/// defined by `shdBadgeConfig(size:variant:)`,
/// ensuring consistent badges across the app. You can provide the display text plus optional size and color
/// variant overrides either at initialization or later via `shdBadgeStyle`.
///
/// ## Usage
/// ```swift
/// SHDBadge(text: "New")
///     .shdBadgeStyle(size: .lg, variant: .warning)
/// ```
public struct SHDBadge: View {

    /// The human-readable string rendered inside the badge capsule.
    private var text: String

    /// Controls the typographic scale and horizontal/vertical padding.
    private var size: SHDBadgeSize = .md

    /// Determines the semantic color palette applied to the badge.
    private var variant: SHDBadgeVariant = .default

    /// Creates a Shade badge and optionally overrides its size or visual variant.
    ///
    /// - Parameters:
    ///   - text: The string displayed inside the badge.
    ///   - size: The layout configuration to use. Defaults to `.md`.
    ///   - variant: The semantic color variant. Defaults to `.default`.
    /// - Discussion: Use initializer parameters for the most common configuration scenario
    ///     keeping chaining free for later adjustments.
    /// - Usage: `SHDBadge(text: "Offline", size: .sm, variant: .destructive)`
    public init(
        text: String
    ) {
        self.text = text
    }

    /// The visual representation of the badge that applies the Shade styling configuration.
    public var body: some View {
        Text(text)
            .shdBadgeConfig(size: size, variant: variant)
    }

    /// Returns a copy of the badge with updated sizing or variant metadata.
    ///
    /// - Parameters:
    ///   - size: The size token applied to padding and typography. Defaults to `.md`.
    ///   - variant: The color scheme to use. Defaults to `.default`.
    /// - Returns: A new `SHDBadge` that reflects the requested overrides.
    /// - Discussion: This helper allows a fluent builder-style syntax when composing badges
    ///     inside larger view hierarchies.
    /// - Usage:
    /// ```swift
    /// SHDBadge(text: "Queued")
    ///     .shdBadgeStyle(size: .sm, variant: .secondary)
    /// ```
    public func shdBadgeStyle(
        size: SHDBadgeSize = .md,
        variant: SHDBadgeVariant = .default
    ) -> Self {
        mutating { badge in
            badge.size = size
            badge.variant = variant
        }
    }
}

#Preview {
    SHDBadgePreview()
}
