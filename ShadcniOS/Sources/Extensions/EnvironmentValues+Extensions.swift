//
//  EnvironmentValues+Extensions.swift
//  ShadcniOS
//
//  Created by JoseAlvarez on 11/20/25.
//

import SwiftUI

/// Extensions to SwiftUI `EnvironmentValues` to support ShadcniOS button system.
///
/// ### Overview
/// These environment values provide a way to propagate **button state and size**
/// throughout a SwiftUI view hierarchy, enabling consistent styling and
/// behavior for ShadcniOS buttons.
///
/// The system currently defines:
/// - `buttonSize` → controls typography and icon sizing for buttons (`SHDButtonSize`)
/// - `isLoading` → indicates whether a view (or button) is in a loading state
///
internal extension EnvironmentValues {

    /// The current button size used by ShadcniOS buttons in the view hierarchy.
    ///
    /// - Default: `.md`
    @Entry var buttonSize: SHDButtonSize = .md

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
