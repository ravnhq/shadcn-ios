//
//  View+Radius.swift
//  shadcn-ios
//
//  Created by JoseAlvarez on 10/31/25.
//

import SwiftUI

public extension View {
    // MARK: - Basic Corner Radius

    /// Applies a corner radius according to the Shadcn radius system.
    ///
    /// ```swift
    /// Button("Click Me") {}
    ///     .CornerRadius(.radiusMD)
    /// ```
    ///
    /// - Parameter radius: A radius value defined in `ShadcnRadiusSizing`.
    /// - Returns: A view with the specified corner radius applied.
    func CornerRadius(_ radius: ShadcnSizing.Radius) -> some View {
        cornerRadius(radius.value)
    }

    // MARK: - Conditional Corner Radius

    /// Conditionally applies a corner radius according to the Shadcn radius system.
    ///
    /// ```swift
    /// Button("Click Me") {}
    ///     .CornerRadius(.radiusLG, active: isRounded)
    /// ```
    ///
    /// - Parameters:
    ///   - radius: A radius value defined in `ShadcnRadiusSizing`.
    ///   - active: A Boolean value that determines whether the corner radius is applied.
    /// - Returns: A view with corner radius applied if `active` is `true`.
    @ViewBuilder
    func CornerRadius(_ radius: ShadcnSizing.Radius?, active: Bool = true) -> some View {
        if let radius, active {
            cornerRadius(radius.value)
        } else {
            self
        }
    }
}
