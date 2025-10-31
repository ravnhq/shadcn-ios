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
public extension View {
    
    /// Applies a Shadcn color as the view's foreground style.
    ///
    /// Use this modifier to set the text, icon, or shape color
    /// using a predefined color from the Shadcn palette.
    ///
    /// ```swift
    /// Text("Hello, world!")
    ///     .fontColor(.foregroundPrimary)
    /// ```
    ///
    /// - Parameter color: A `ShadcnColor` value representing the desired color.
    /// - Returns: A view modified with the specified Shadcn foreground color.
    func fontColor(_ color: ShadcnColor) -> some View {
        self.foregroundStyle(color.color)
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
    /// - Parameter color: A `ShadcnColor` representing the desired background color.
    /// - Returns: A view modified with the specified Shadcn background color.
    func backgroundColor(_ color: ShadcnColor) -> some View {
        self.background(color.color)
    }

    /// Applies a Shadcn color as the view's border.
    ///
    /// Adds a rounded rectangle stroke around the view using
    /// a Shadcn color and a customizable width.
    ///
    /// ```swift
    /// Text("Outlined")
    ///     .padding()
    ///     .borderColor(.borderAccent, width: 2)
    /// ```
    ///
    /// - Parameters:
    ///   - color: A `ShadcnColor` representing the border color.
    ///   - width: The thickness of the border. Defaults to `1`.
    /// - Returns: A view modified with the specified Shadcn border.
    func borderColor(_ color: ShadcnColor, width: CGFloat = 1) -> some View {
        self.overlay(
            RoundedRectangle(cornerRadius: 4)
                .stroke(color.color, lineWidth: width)
        )
    }
}
