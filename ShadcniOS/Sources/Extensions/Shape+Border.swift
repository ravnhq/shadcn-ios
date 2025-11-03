//
//  Shape+Border.swift
//  shadcn-ios
//
//  Created by JoseAlvarez on 10/31/25.
//

import SwiftUI

public extension Shape {
    /// Applies a Shadcn design system color as the border of any `Shape`.
    ///
    /// Use this modifier to apply a colored stroke around vector-based
    /// shapes such as `Circle`, `Capsule`, or `RoundedRectangle`, using
    /// a predefined `SHDColor` from the design system palette.
    ///
    /// ```swift
    /// Capsule()
    ///     .borderColor(.borderAccent, width: 2)
    ///     .frame(width: 120, height: 50)
    /// ```
    ///
    /// - Parameters:
    ///   - color: A `SHDColor` representing the stroke color.
    ///   - width: The thickness of the border. Defaults to `1`.
    /// - Returns: A view that renders the shape with the specified border color and width.
    func borderColor(_ color: SHDColor, width: CGFloat = 1) -> some View {
        stroke(color.color, lineWidth: width)
    }
}
