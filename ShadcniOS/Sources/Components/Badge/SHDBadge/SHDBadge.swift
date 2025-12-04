//
//  SHDBadge.swift
//  ShadcniOS
//
//  Created by JoseAlvarez on 11/26/25.
//

import SwiftUI

/// A pill-shaped badge for short status text in the Shade design system.
///
/// ## Discussion
/// `SHDBadge` applies Shade typography, spacing, and color tokens to maintain
/// visual consistency across the interface. Badge size and style determine
/// typography, padding, background, border, and foreground colors.
/// Default configuration is `.md` size and `.default` variant.
///
/// ## Parameters
/// - text: The text shown inside the badge.
///
/// ## Usage
/// ```swift
/// SHDBadge(text: "Offline")
///     .badgeStyle(size: .sm, variant: .destructive)
/// ```
/// Use ``badgeStyle(size:variant:)`` to apply alternate visual configurations.
///
public struct SHDBadge: View {

    private var text: String
    private var size: SHDBadgeSize = .md
    private var variant: SHDBadgeVariant = .default

    public init(text: String) {
        self.text = text
    }

    public var body: some View {
        Text(text)
            .textStyle(size.textStyle)
            .padding(.vertical, 2)
            .padding(.horizontal, size.horizontalPadding)
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

    /// Returns a new badge configured with the provided size and variant.
    ///
    /// - Parameters:
    ///   - size: The badge size to apply. Defaults to `.md`.
    ///   - variant: The visual style to apply. Defaults to `.default`.
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
