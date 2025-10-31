//
//  View+Padding.swift
//  shadcn-ios
//
//  Created by JoseAlvarez on 10/31/25.
//

import SwiftUI

public extension View {

    // MARK: - Basic Padding

    /// Applies padding according to the Shadcn spacing system.
    ///
    /// ```swift
    /// Text("Hello")
    ///     .shadcnPadding(.paddingMD)
    /// ```
    ///
    /// - Parameter size: A size value defined in `ShadcnPaddingSizing`.
    /// - Returns: A view with the specified padding applied.
    func shadcnPadding(_ size: ShadcnPaddingSizing) -> some View {
        padding(size.size)
    }

    /// Applies horizontal padding according to the Shadcn spacing system.
    ///
    /// - Parameter size: A size value defined in `ShadcnPaddingSizing`.
    /// - Returns: A view with horizontal padding applied.
    func shadcnPaddingHorizontal(_ size: ShadcnPaddingSizing) -> some View {
        padding(.horizontal, size.size)
    }

    /// Applies vertical padding according to the Shadcn spacing system.
    ///
    /// - Parameter size: A size value defined in `ShadcnPaddingSizing`.
    /// - Returns: A view with vertical padding applied.
    func shadcnPaddingVertical(_ size: ShadcnPaddingSizing) -> some View {
        padding(.vertical, size.size)
    }

    // MARK: - Directional Padding

    /// Applies top padding according to the Shadcn spacing system.
    func shadcnPaddingTop(_ size: ShadcnPaddingSizing) -> some View {
        padding(.top, size.size)
    }

    /// Applies bottom padding according to the Shadcn spacing system.
    func shadcnPaddingBottom(_ size: ShadcnPaddingSizing) -> some View {
        padding(.bottom, size.size)
    }

    /// Applies leading padding according to the Shadcn spacing system.
    func shadcnPaddingLeading(_ size: ShadcnPaddingSizing) -> some View {
        padding(.leading, size.size)
    }

    /// Applies trailing padding according to the Shadcn spacing system.
    func shadcnPaddingTrailing(_ size: ShadcnPaddingSizing) -> some View {
        padding(.trailing, size.size)
    }

    // MARK: - Custom Edge Padding

    /// Applies padding to specific edges according to the Shadcn spacing system.
    ///
    /// ```swift
    /// Text("Hello")
    ///     .shadcnPadding([.top, .horizontal], .paddingLG)
    /// ```
    ///
    /// - Parameters:
    ///   - edges: The set of edges to apply padding to.
    ///   - size: A size value defined in `ShadcnPaddingSizing`.
    /// - Returns: A view with the specified edge padding applied.
    func shadcnPadding(_ edges: Edge.Set, _ size: ShadcnPaddingSizing) -> some View {
        padding(edges, size.size)
    }

    // MARK: - Conditional Padding

    /// Conditionally applies padding according to the Shadcn spacing system.
    ///
    /// ```swift
    /// Text("Hello")
    ///     .shadcnPadding(.paddingMD, active: showPadding)
    /// ```
    ///
    /// - Parameters:
    ///   - size: A size value defined in `ShadcnPaddingSizing`.
    ///   - active: A Boolean value that determines whether padding is applied.
    /// - Returns: A view with padding applied if `active` is `true`.
    @ViewBuilder
    func shadcnPadding(_ size: ShadcnPaddingSizing?, active: Bool = true) -> some View {
        if let size, active {
            padding(size.size)
        } else {
            self
        }
    }

    // MARK: - Safe Area Padding

    /// Applies padding relative to the safe area using the Shadcn spacing system.
    ///
    /// ```swift
    /// Text("Footer")
    ///     .shadcnSafeAreaPadding(.bottom, .paddingXL)
    /// ```
    ///
    /// - Parameters:
    ///   - edges: The set of safe area edges to pad.
    ///   - size: A size value defined in `ShadcnPaddingSizing`.
    /// - Returns: A view that applies safe-area-aware padding.
    func shadcnSafeAreaPadding(_ edges: Edge.Set = .all, _ size: ShadcnPaddingSizing) -> some View {
        self
            .padding(edges, size.size)
            .ignoresSafeArea(.container, edges: edges)
    }
}
