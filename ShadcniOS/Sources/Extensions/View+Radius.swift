//
//  View+Radius.swift
//  shadcn-ios
//
//  Created by JoseAlvarez on 10/31/25.
//

import SwiftUI

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

    // MARK: - Conditional Corner Radius

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
