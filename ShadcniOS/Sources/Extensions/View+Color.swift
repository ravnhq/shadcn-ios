//
//  View+Color.swift
//  shadcn-ios
//
//  Created by Jose Alvarez on 10/30/25.
//

import SwiftUI

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
