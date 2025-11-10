//
//  View+TextStyle.swift
//  ShadcniOS
//
//  Created by JoseAlvarez on 11/10/25.
//

import SwiftUI

internal extension View {
    /// Convenience method to apply an `SHDTextStyle` to any view.
    ///
    /// Example:
    /// ```swift
    /// Text("Hello World")
    ///     .textStyle(.h1) // Apply predefined H1 style
    /// ```
    ///
    /// - Parameter style: The `SHDTextStyle` to apply.
    /// - Returns: The view with the specified text style applied.
    func textStyle(_ style: SHDTextStyle) -> some View {
        self.modifier(TextStyle(style: style))
    }
}
