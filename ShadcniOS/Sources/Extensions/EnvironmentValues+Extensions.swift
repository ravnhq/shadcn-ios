//
//  EnvironmentValues+Extensions.swift
//  ShadcniOS
//
//  Created by JoseAlvarez on 11/20/25.
//

import SwiftUI

internal extension EnvironmentValues {
    /// Indicates whether the view hierarchy is in a loading state.
    ///
    /// Buttons and icons can respond by showing loading indicators or reducing
    /// opacity.
    ///
    /// - Default: `false`
    @Entry var isLoading: Bool = false
}

internal extension View {

    /// Sets the loading state for the current view hierarchy.
    ///
    /// - Parameter isLoading: A Boolean value indicating whether the view is loading.
    /// - Returns: A view with the updated `isLoading` environment value.
    ///
    /// This allows buttons and other components to react to loading states
    /// automatically.
    ///
    /// ### Usage Example
    /// ```swift
    /// SHDButton(label: "Save") { viewModel.save() }
    ///     .isLoading(viewModel.isSaving)
    /// ```
    ///
    /// When `isLoading == true`:
    /// - Icon-only buttons show `SHDLoadingIcon()`.
    /// - Buttons with text reduce opacity to 0.5.
    ///
    public func isLoading(_ isLoading: Bool) -> some View {
        environment(\.isLoading, isLoading)
    }
}
