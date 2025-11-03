//
//  View+Padding.swift
//  shadcn-ios
//
//  Created by JoseAlvarez on 10/31/25.
//

import SwiftUI

/// A set of convenience padding modifiers that extend `View` to support
/// the custom `ShadcnSizing` system.
///
/// These modifiers allow you to:
/// - Apply padding based on design tokens (`Padding` or `Spacing`)
/// - Conditionally apply padding only when needed
/// - Apply padding that ignores safe areas
///
/// Example:
/// ```swift
/// VStack {
///     Text("Hello")
///         .Padding(.vertical, .md) // Uses ShadcnSizing.Padding
///
///     Text("World")
///         .Padding(.horizontal, .lg) // Uses ShadcnSizing.Spacing
/// }
/// ```
public extension View {

    // MARK: - Custom Edge Padding

    /// Applies padding to the specified edges using a predefined `ShadcnSizing.Padding` value.
    ///
    /// - Parameters:
    ///   - edges: The edges to apply padding to (e.g., `.horizontal`, `.vertical`, or `.all`).
    ///   - size: A `ShadcnSizing.Padding` value that determines the padding amount.
    /// - Returns: A view with the specified edge padding applied.
    ///
    /// ### Example
    /// ```swift
    /// Text("Hello World")
    ///     .Padding(.horizontal, .md)
    /// ```
    func Padding(_ edges: Edge.Set, _ size: ShadcnSizing.Padding) -> some View {
        padding(edges, size.value)
    }

    /// Applies padding to the specified edges using a predefined `ShadcnSizing.Spacing` value.
    ///
    /// - Parameters:
    ///   - edges: The edges to apply padding to (e.g., `.leading`, `.trailing`, `.bottom`).
    ///   - size: A `ShadcnSizing.Spacing` value that determines the padding amount.
    /// - Returns: A view with the specified edge padding applied.
    ///
    /// ### Example
    /// ```swift
    /// Text("Welcome")
    ///     .Padding(.vertical, .xl)
    /// ```
    func Padding(_ edges: Edge.Set, _ size: ShadcnSizing.Spacing) -> some View {
        padding(edges, size.value)
    }

    // MARK: - Conditional Padding

    /// Conditionally applies padding using a `ShadcnSizing.Padding` value.
    ///
    /// - Parameters:
    ///   - size: The padding size to apply. If `nil`, no padding is applied.
    ///   - active: A Boolean flag indicating whether padding should be applied.
    /// - Returns: A view with padding applied only when `active` is `true` and `size` is not `nil`.
    ///
    /// ### Example
    /// ```swift
    /// Text("Optional Padding")
    ///     .Padding(.lg, active: isExpanded)
    /// ```
    @ViewBuilder
    func Padding(_ size: ShadcnSizing.Padding?, active: Bool = true) -> some View {
        if let size, active {
            padding(size.value)
        } else {
            self
        }
    }

    /// Conditionally applies padding using a `ShadcnSizing.Spacing` value.
    ///
    /// - Parameters:
    ///   - size: The spacing size to apply. If `nil`, no padding is applied.
    ///   - active: A Boolean flag indicating whether padding should be applied.
    /// - Returns: A view with padding applied only when `active` is `true` and `size` is not `nil`.
    ///
    /// ### Example
    /// ```swift
    /// Text("Dynamic Spacing")
    ///     .Padding(.md, active: showDetail)
    /// ```
    @ViewBuilder
    func Padding(_ size: ShadcnSizing.Spacing?, active: Bool = true) -> some View {
        if let size, active {
            padding(size.value)
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
    ///   - size: A `ShadcnSizing.Padding` value that determines the padding amount.
    /// - Returns: A view with safe area–ignoring padding applied.
    ///
    /// ### Example
    /// ```swift
    /// Color.blue
    ///     .SafeAreaPadding(.top, .xl)
    /// ```
    func SafeAreaPadding(_ edges: Edge.Set = .all, _ size: ShadcnSizing.Padding) -> some View {
        self
            .padding(edges, size.value)
            .ignoresSafeArea(.container, edges: edges)
    }

    /// Applies padding to the specified edges while ignoring the safe area insets.
    ///
    /// - Parameters:
    ///   - edges: The edges to apply padding to. Defaults to `.all`.
    ///   - size: A `ShadcnSizing.Spacing` value that determines the padding amount.
    /// - Returns: A view with safe area–ignoring padding applied.
    ///
    /// ### Example
    /// ```swift
    /// Color.green
    ///     .SafeAreaPadding(.bottom, .lg)
    /// ```
    func SafeAreaPadding(_ edges: Edge.Set = .all, _ size: ShadcnSizing.Spacing) -> some View {
        self
            .padding(edges, size.value)
            .ignoresSafeArea(.container, edges: edges)
    }
}
