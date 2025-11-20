//
//  LoadingKey.swift
//  ShadcniOS
//
//  Created by JoseAlvarez on 11/20/25.
//

import SwiftUI

/// Environment key used to store the loading state for views.
///
/// This key enables components such as `SHDButton` to react to loading states
/// provided externally through the view hierarchy.
private struct IsLoadingKey: EnvironmentKey {
    static let defaultValue: Bool = false
}

extension EnvironmentValues {

    /// Indicates whether the current view hierarchy is in a loading state.
    ///
    /// Set through the `.isLoading(_:)` modifier.
    var isLoading: Bool {
        get {
            self[IsLoadingKey.self]
        }
        set {
            self[IsLoadingKey.self] = newValue
        }
    }
}

public extension View {

    /// Sets the loading state for the current view hierarchy.
    ///
    /// - Parameter isLoading: A Boolean value indicating whether the view is loading.
    /// - Returns: A view with the updated loading environment value.
    ///
    /// ### Example
    /// ```swift
    /// SHDButton(label: "Save") { viewModel.save() }
    ///     .isLoading(viewModel.isSaving)
    /// ```
    public func isLoading(_ isLoading: Bool) -> some View {
        environment(\.isLoading, isLoading)
    }
}
