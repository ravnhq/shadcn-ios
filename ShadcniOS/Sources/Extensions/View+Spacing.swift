//
//  View+Spacing.swift
//  ShadcniOS
//
//  Created by JoseAlvarez on 11/4/25.
//

import SwiftUI

internal extension VStack {
    /// Creates a vertical stack that arranges its child views in a column, using a custom `SHDSizing.Spacing` value
    /// instead of a standard `CGFloat` for spacing.
    ///
    /// This initializer provides a type-safe way to define spacing between elements in a `VStack`,
    /// using design-system-defined values from `SHDSizing.Spacing`.
    ///
    /// - Parameters:
    ///   - alignment: The horizontal alignment of the stack’s children. The default is `.center`.
    ///   - spacing: The amount of space between adjacent subviews, represented by `SHDSizing.Spacing`.
    ///   - content: A view builder that creates the content of the stack.
    ///
    /// - Example:
    /// ```swift
    /// VStack(spacing: .xxl) {
    ///     Text("Title")
    ///     Text("Subtitle")
    /// }
    /// ```
    init(
        alignment: HorizontalAlignment = .center,
        spacing: SHDSizing.Spacing,
        @ViewBuilder content: () -> Content
    ) {
        self.init(
            alignment: alignment,
            spacing: spacing.value,
            content: content
        )
    }
}

internal extension HStack {
    /// Creates a horizontal stack that arranges its child views in a row, using a custom `SHDSizing.Spacing` value
    /// instead of a standard `CGFloat` for spacing.
    ///
    /// This initializer provides a type-safe way to define spacing between elements in a `HStack`,
    /// using design-system-defined values from `SHDSizing.Spacing`.
    ///
    /// - Parameters:
    ///   - alignment: The vertical alignment of the stack’s children. The default is `.center`.
    ///   - spacing: The amount of space between adjacent subviews, represented by `SHDSizing.Spacing`.
    ///   - content: A view builder that creates the content of the stack.
    ///
    /// - Example:
    /// ```swift
    /// HStack(spacing: .xxl) {
    ///     Image(systemName: "star.fill")
    ///     Text("Favorite")
    /// }
    /// ```
    init(
        alignment: VerticalAlignment = .center,
        spacing: SHDSizing.Spacing,
        @ViewBuilder content: () -> Content
    ) {
        self.init(
            alignment: alignment,
            spacing: spacing.value,
            content: content
        )
    }
}
