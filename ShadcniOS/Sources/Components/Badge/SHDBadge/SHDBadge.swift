//
//  SHDBadge.swift
//  ShadcniOS
//
//  Created by JoseAlvarez on 11/26/25.
//

import SwiftUI

/// - Description: A pill-shaped badge for short status text in the Shade design system.
/// - Discussion: `SHDBadge` applies Shade typography, spacing, and color tokens to keep
///   badges visually consistent. Configure size and visual style using
///   `badgeStyle(size:variant:)` to match different contexts.
public struct SHDBadge: View {

    private var text: String

    private var size: SHDBadgeSize = .md

    private var variant: SHDBadgeVariant = .default

    /// - Description: Creates a badge that displays the given text.
    /// - Parameters:
    ///   - text: The text shown inside the badge.
    /// - Discussion: The badge starts with `.md` size and `.default` variant.
    ///   Call `badgeStyle(size:variant:)` to override these defaults.
    /// - Usage:
    ///   ```swift
    ///   SHDBadge(text: "Offline")
    ///       .badgeStyle(size: .sm, variant: .destructive)
    ///   ```
    public init(
        text: String
    ) {
        self.text = text
    }

    /// - Description: The view that renders the badge using the current size and variant.
    /// - Discussion: Applies Shade typography, padding, background, border, and foreground
    ///   colors based on the configured `SHDBadgeSize` and `SHDBadgeVariant` values.
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

    /// - Description: Returns a badge configured with the given size and variant.
    /// - Parameters:
    ///   - size: The badge size to apply. Defaults to `.md`.
    ///   - variant: The visual style to apply. Defaults to `.default`.
    /// - Returns: A new `SHDBadge` instance with the requested configuration.
    /// - Discussion: Use this helper for a fluent configuration style when composing badges
    ///   inside larger views.
    /// - Usage:
    ///   ```swift
    ///   SHDBadge(text: "Queued")
    ///       .badgeStyle(size: .sm, variant: .secondary)
    ///   ```
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
