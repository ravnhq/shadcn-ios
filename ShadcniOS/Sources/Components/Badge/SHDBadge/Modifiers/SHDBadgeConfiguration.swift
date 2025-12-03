//
//  SHDBadgeConfiguration.swift
//  ShadcniOS
//
//  Created by JoseAlvarez on 11/26/25.
//

import SwiftUI

/// A `ViewModifier` that renders badge content with a rounded capsule background,
/// text styling, and optional stroke based on the selected badge design system values.
///
/// - Discussion:
///   `SHDBadgeConfiguration` centralizes the visual styling for badges so the
///   same typography, padding, background, and border rules are applied consistently.
///   Adjust the `size` to control padding and text style, and select a `variant`
///   to change colors or emphasize the badge state.
internal struct SHDBadgeConfiguration: ViewModifier {

    /// Determines the typography and padding rules applied to the badge content.
    var size: SHDBadgeSize

    /// Selects the foreground, background, and border colors for the badge.
    var variant: SHDBadgeVariant

    /// Composes the badge layout by stacking typography, padding, and capsule
    /// backgrounds around the provided content.
    ///
    /// - Parameter content: The view content displayed inside the badge.
    func body(content: Content) -> some View {
        content
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
}

extension View {

    /// Applies the standard Shade badge styling to the current view.
    ///
    /// - Parameters:
    ///   - size: Badge size defining typography and padding. Defaults to `.md`.
    ///   - variant: Badge visual variant used for color selection. Defaults to `.default`.
    ///
    /// - Discussion:
    ///   This modifier is a convenience wrapper around `SHDBadgeConfiguration`
    ///   that keeps badge styling consistent across the app. Adjust the inputs
    ///   to react to semantic states such as success, warning, or muted badges.
    ///
    /// - Usage:
    ///   ```swift
    ///   SHDBadge(text: "New")
    ///       .shdBadgeConfig(size: .lg, variant: .default)
    ///   ```
    func shdBadgeConfig(
        size: SHDBadgeSize = .md,
        variant: SHDBadgeVariant = .default
    ) -> some View {
        modifier(SHDBadgeConfiguration(size: size, variant: variant))
    }
}
