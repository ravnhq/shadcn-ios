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
    /// ## Discussion
    /// Buttons and icons can respond by showing loading indicators or reducing
    /// opacity.
    ///
    /// - Default: `false`
    @Entry var isLoading: Bool = false

    /// An environment key used to determine whether a `SHDTextField` should display an inline error message.
    /// The default value is `nil`, meaning no error message is displayed by default.
    @Entry var inlineError: LocalizedStringKey?
}

internal extension View {

    /// Sets the loading state for the current view hierarchy.
    ///
    /// ## Discussion
    /// This allows buttons and other components to react to loading states
    /// automatically.
    ///
    /// When `isLoading == true`:
    /// - Icon-only buttons show `SHDLoadingIcon()`.
    /// - Buttons with text reduce opacity to 0.5.
    ///
    /// ## Usage
    /// ```swift
    /// SHDButton(label: "Save") { viewModel.save() }
    ///     .isLoading(viewModel.isSaving)
    /// ```
    ///
    /// - Parameters:
    ///   - isLoading: A Boolean value indicating whether the view is loading.
    /// - Returns: A view with the updated `isLoading` environment value.
    public func isLoading(_ isLoading: Bool) -> some View {
        environment(\.isLoading, isLoading)
    }
}
