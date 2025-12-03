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
/// `SHDBadge` applies padding, typography, and color rules directly in its body,
/// ensuring consistent badges across the app. You can provide the display text and configure
/// size and color variant using the `badgeStyle(size:variant:)` method.
///
/// ## Usage
/// ```swift
/// SHDBadge(text: "New")
///     .badgeStyle(size: .lg, variant: .default)
/// ```
public struct SHDBadge: View {

    /// The human-readable string rendered inside the badge capsule.
    private var text: String

    /// Controls the typographic scale and horizontal/vertical padding.
    private var size: SHDBadgeSize = .md

    /// Determines the semantic color palette applied to the badge.
    private var variant: SHDBadgeVariant = .default

    /// Creates a Shade badge with the specified text.
    ///
    /// - Parameters:
    ///   - text: The string displayed inside the badge.
    /// - Discussion: The badge defaults to `.md` size and `.default` variant.
    ///     Use `badgeStyle(size:variant:)` to customize the appearance.
    /// - Usage: `SHDBadge(text: "Offline").badgeStyle(size: .sm, variant: .destructive)`
    public init(
        text: String
    ) {
        self.text = text
    }

    /// The visual representation of the badge that applies Shade styling directly.
    /// 
    /// The styling includes typography, padding, background color, border, and foreground color
    /// based on the current `size` and `variant` properties.
    public var body: some View {
        Text(text)
            .textStyle(size.textStyle)
            .padding(.vertical, 2)
            .padding(.horizontal, .xs)
            .background(
                RoundedRectangle(cornerRadius: .full)
                    .fill(variant.backgroundColor.color)
            )
            .overlay(
                RoundedRectangle(cornerRadius: .full)
                    .stroke(
                        variant.borderColor.color,
                        lineWidth: variant.borderColor == .clear ? 0 : 1
                    )
            )
            .foregroundColor(variant.foregroundColor)
    }

    /// Returns a copy of the badge with updated sizing or variant metadata.
    ///
    /// - Parameters:
    ///   - size: The size token applied to padding and typography. Defaults to `.md`.
    ///   - variant: The color scheme to use. Defaults to `.default`.
    /// - Returns: A new `SHDBadge` that reflects the requested overrides.
    /// - Discussion: This helper allows a fluent builder-style syntax when composing badges
    ///     inside larger view hierarchies. The styling is applied directly in the badge's body.
    /// - Usage:
    /// ```swift
    /// SHDBadge(text: "Queued")
    ///     .badgeStyle(size: .sm, variant: .secondary)
    /// ```
    public func badgeStyle(
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
