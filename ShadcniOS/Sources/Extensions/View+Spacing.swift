//
//  View+Spacing.swift
//  shadcn-ios
//
//  Created by JoseAlvarez on 10/31/25.
//

import SwiftUI

public extension View {

    // MARK: - Basic Spacing / Padding

    /// Applies spacing as padding using the Shadcn spacing system.
    ///
    /// ```swift
    /// Text("Hello")
    ///     .shadcnSpacing(.spacingMD)
    /// ```
    ///
    /// - Parameter spacing: A value defined in `ShadcnSpacingSizing`.
    /// - Returns: A view with the specified padding applied.
    func shadcnSpacing(_ spacing: ShadcnSpacingSizing) -> some View {
        padding(spacing.size)
    }

    /// Applies horizontal spacing as padding using the Shadcn spacing system.
    ///
    /// - Parameter spacing: A value defined in `ShadcnSpacingSizing`.
    /// - Returns: A view with horizontal padding applied.
    func shadcnSpacingHorizontal(_ spacing: ShadcnSpacingSizing) -> some View {
        padding(.horizontal, spacing.size)
    }

    /// Applies vertical spacing as padding using the Shadcn spacing system.
    ///
    /// - Parameter spacing: A value defined in `ShadcnSpacingSizing`.
    /// - Returns: A view with vertical padding applied.
    func shadcnSpacingVertical(_ spacing: ShadcnSpacingSizing) -> some View {
        padding(.vertical, spacing.size)
    }

    // MARK: - Directional Spacing

    /// Applies top spacing as padding.
    func shadcnSpacingTop(_ spacing: ShadcnSpacingSizing) -> some View {
        padding(.top, spacing.size)
    }

    /// Applies bottom spacing as padding.
    func shadcnSpacingBottom(_ spacing: ShadcnSpacingSizing) -> some View {
        padding(.bottom, spacing.size)
    }

    /// Applies leading spacing as padding.
    func shadcnSpacingLeading(_ spacing: ShadcnSpacingSizing) -> some View {
        padding(.leading, spacing.size)
    }

    /// Applies trailing spacing as padding.
    func shadcnSpacingTrailing(_ spacing: ShadcnSpacingSizing) -> some View {
        padding(.trailing, spacing.size)
    }

    // MARK: - Custom Edge Spacing

    /// Applies spacing to specific edges.
    ///
    /// ```swift
    /// Text("Hello")
    ///     .shadcnSpacing([.top, .horizontal], .spacingLG)
    /// ```
    ///
    /// - Parameters:
    ///   - edges: The set of edges to apply spacing to.
    ///   - spacing: A value defined in `ShadcnSpacingSizing`.
    /// - Returns: A view with the specified edge spacing applied.
    func shadcnSpacing(_ edges: Edge.Set, _ spacing: ShadcnSpacingSizing) -> some View {
        padding(edges, spacing.size)
    }
}
