//
//  View+Extensions.swift
//  ShadcniOS
//
//  Created by JoseAlvarez on 11/11/25.
//

import SwiftUI

// MARK: - Color
/// Extends `View` to easily apply Shadcn design system colors
/// to foregrounds, backgrounds, and borders within SwiftUI views.
///
/// These modifiers provide a convenient way to maintain visual
/// consistency using the Shadcn color palette across your iOS app.
internal extension View {

    /// Applies a Shadcn color as the view's foreground style.
    ///
    /// Use this modifier to set the text, icon, or shape color
    /// using a predefined color from the Shadcn palette.
    ///
    /// ```swift
    /// Text("Hello, world!")
    ///     .foregroundColor(.foregroundPrimary)
    /// ```
    ///
    /// - Parameter color: A `SHDColor` value representing the desired color.
    /// - Returns: A view modified with the specified Shadcn foreground color.
    func foregroundColor(_ color: SHDColor) -> some View {
        foregroundStyle(color.color)
    }

    /// Applies a Shadcn color as the view's background.
    ///
    /// This modifier sets the background of the view using a
    /// predefined color from the Shadcn color palette.
    ///
    /// ```swift
    /// Text("Button")
    ///     .padding()
    ///     .backgroundColor(.backgroundDestructivePrimary)
    /// ```
    ///
    /// - Parameter color: A `SHDColor` representing the desired background color.
    /// - Returns: A view modified with the specified Shadcn background color.
    func backgroundColor(_ color: SHDColor) -> some View {
        background(color.color)
    }
}

// MARK: - Mutating
/// A helper extension that allows mutation of view properties within immutable SwiftUI view structs.
///
/// This utility enables modifying a specific property on a copy of a `View`,
/// effectively creating a new instance with the updated value.
/// It’s particularly useful for creating view modifier–like APIs that mutate internal
/// configuration values (e.g., updating size, color, or style properties).
///
/// Example:
/// ```swift
/// struct MyView: View {
///     private var color: Color = .blue
///
///     var body: some View {
///         Text("Hello")
///             .foregroundColor(color)
///     }
///
///     func viewColor(_ color: Color) -> some View {
///         mutating(keyPath: \.color, value: color)
///     }
/// }
/// ```
///
/// - Important: This function should only be used for creating *modifier-style* APIs in value types
///   (like SwiftUI `View`s). Avoid using it for mutable shared state or side effects.
internal extension View {

    /// Returns a copy of the current view with a modified property value.
    ///
    /// - Parameters:
    ///   - keyPath: A writable key path to the property to be updated.
    ///   - value: The new value to assign to the property.
    /// - Returns: A new instance of `Self` with the updated property value.
    func mutating<T>(keyPath: WritableKeyPath<Self, T>, value: T) -> Self {
        var newSelf = self
        newSelf[keyPath: keyPath] = value
        return newSelf
    }
}

// MARK: - Padding
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

    // MARK: -- Conditional Padding

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

    // MARK: -- Safe Area Padding

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

// MARK: - Radius
internal extension View {
    // MARK: - Basic Corner Radius

    /// Applies a corner radius according to the Shadcn radius system.
    ///
    /// ```swift
    /// Button("Click Me") {}
    ///     .cornerRadius(.md)
    /// ```
    ///
    /// - Parameter radius: A radius value defined in `SHDSizing.Radius`.
    /// - Returns: A view with the specified corner radius applied.
    func cornerRadius(_ radius: SHDSizing.Radius) -> some View {
        cornerRadius(radius.value)
    }

    // MARK: -- Conditional Corner Radius

    /// Conditionally applies a corner radius according to the Shadcn radius system.
    ///
    /// ```swift
    /// Button("Click Me") {}
    ///     .cornerRadius(.radiusLG, active: isRounded)
    /// ```
    ///
    /// - Parameters:
    ///   - radius: A radius value defined in `SHDSizing.Radius`.
    ///   - active: A Boolean value that determines whether the corner radius is applied.
    /// - Returns: A view with corner radius applied if `active` is `true`.
    @ViewBuilder
    func cornerRadius(_ radius: SHDSizing.Radius?, active: Bool = true) -> some View {
        if let radius, active {
            cornerRadius(radius.value)
        } else {
            self
        }
    }
}

// MARK: - Spacing
internal extension VStack {
    /// Creates a vertical stack that arranges its child views in a column
    /// using a custom `SHDSizing.Spacing` value
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
    /// Creates a horizontal stack that arranges its child views in a row
    /// using a custom `SHDSizing.Spacing` value
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

// MARK: - Rectangle

/// A convenience initializer that allows using the ShadcniOS
/// design system's radius tokens (`SHDSizing.Radius`) directly
/// with SwiftUI's `RoundedRectangle`.
///
/// ### Discussion
/// `RoundedRectangle` normally requires a `CGFloat` for its corner radius.
/// Since ShadcniOS provides predefined radius tokens through
/// `SHDSizing.Radius`, this extension improves ergonomics by enabling:
///
/// ```swift
/// RoundedRectangle(cornerRadius: .lg)
/// ```
///
/// instead of:
///
/// ```swift
/// RoundedRectangle(cornerRadius: SHDSizing.Radius.lg.value)
/// ```
///
/// This keeps button, card, and component styling consistent with the
/// design system while reducing verbosity.
///
/// ### Usage
///
/// ```swift
/// RoundedRectangle(cornerRadius: .md)
///     .fill(.blue)
///     .frame(width: 100, height: 50)
/// ```
///
/// Or as part of overlays and backgrounds:
///
/// ```swift
/// .overlay(
///     RoundedRectangle(cornerRadius: .xl)
///         .stroke(Color.gray.opacity(0.3), lineWidth: 1)
/// )
/// ```
///
extension RoundedRectangle {

    /// Creates a `RoundedRectangle` using a ShadcniOS radius token.
    ///
    /// - Parameter radius: A design-system radius from `SHDSizing.Radius`.
    /// - Note: Internally converts the token to a `CGFloat`.
    init(cornerRadius radius: SHDSizing.Radius) {
        self.init(cornerRadius: radius.value)
    }
}
