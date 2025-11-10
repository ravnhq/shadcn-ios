//
//  View+Padding.swift
//  shadcn-ios
//
//  Created by JoseAlvarez on 10/31/25.
//

import SwiftUI

internal extension View {

    // MARK: - Custom Edge Padding

    /// Applies padding to the specified edges using a predefined `SHDSizing.Padding` value.
    ///
    /// - Parameters:
    ///   - edges: The edges to apply padding to (e.g., `.horizontal`, `.vertical`, or `.all`).
    ///   - size: A `SHDSizing.Padding` value that determines the padding amount.
    /// - Returns: A view with the specified edge padding applied.
    ///
    /// ### Example
    /// ```swift
    /// Text("Hello World")
    ///     .padding(.horizontal, .md)
    /// ```
    func padding(_ edges: Edge.Set, _ size: SHDSizing.Padding) -> some View {
        padding(edges, size.value)
    }

    // MARK: - Conditional Padding

    /// Conditionally applies padding using a `SHDSizing.Padding` value.
    ///
    /// - Parameters:
    ///   - size: The padding size to apply.
    ///   - active: A Boolean flag indicating whether padding should be applied.
    /// - Returns: A view with padding applied only when `active` is `true` and `size` is not `nil`.
    ///
    /// ### Example
    /// ```swift
    /// Text("Optional Padding")
    ///     .padding(.horizontal, .lg, active: isExpanded)
    /// ```
    @ViewBuilder
    func padding(_ edges: Edge.Set, _ size: SHDSizing.Padding, active: Bool = true) -> some View {
        if active {
            padding(edges, size.value)
        } else {
            self
        }
    }

    // MARK: - Safe Area Padding

    /// Applies padding to the specified edges while ignoring the safe area insets.
    ///
    /// This is useful for full-screen backgrounds or layouts where you
    /// want content to extend beneath system UI elements.
    ///
    /// - Parameters:
    ///   - edges: The edges to apply padding to. Defaults to `.all`.
    ///   - size: A `SHDSizing.Padding` value that determines the padding amount.
    /// - Returns: A view with safe area–ignoring padding applied.
    ///
    /// ### Example
    /// ```swift
    /// Color.blue
    ///     .safeAreaPadding(.top, .xl)
    /// ```
    func safeAreaPadding(_ edges: Edge.Set = .all, _ size: SHDSizing.Padding) -> some View {
        self
            .padding(edges, size.value)
            .ignoresSafeArea(.container, edges: edges)
    }
}
