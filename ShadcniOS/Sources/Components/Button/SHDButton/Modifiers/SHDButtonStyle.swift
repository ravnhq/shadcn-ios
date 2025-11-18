//
//  SHDButtonStyle.swift
//  ShadcniOS
//
//  Created by JoseAlvarez on 11/17/25.
//

import SwiftUI

/// A view modifier that applies an interaction state style to a button based on `StyleButton`.
///
/// ### Discussion
/// `SHDButtonStyle` adjusts the visual appearance of a button according to its state:
/// default, loading, or disabled. Currently, it modifies the button's opacity to
/// communicate the state to the user:
/// - `.buttonDefault` → fully opaque
/// - `.buttonLoading` → semi-transparent
/// - `.buttonDisable` → semi-transparent
///
/// Use the `shdButtonStyle(_:)` view modifier to apply a `StyleButton` state
/// to any SwiftUI button or view that represents a button.
///
/// ### Usage
///
/// Applying default style:
/// ```swift
/// SHDButton(label: "Continue") {
///     print("Button tapped")
/// }
/// .shdButtonStyle(.buttonDefault)
/// ```
///
/// Applying loading style:
/// ```swift
/// SHDButton(label: "Sending") {
///     viewModel.sendMessage()
/// }
/// .shdButtonStyle(.buttonLoading)
/// ```
///
/// Applying disabled style:
/// ```swift
/// SHDButton(label: "Submit") {
///     viewModel.submitForm()
/// }
/// .shdButtonStyle(.buttonDisable)
/// ```
internal struct SHDButtonStyle: ViewModifier {

    // MARK: - Properties

    /// The style to apply to the button.
    let style: StyleButton

    // MARK: - Initializer

    /// Creates a new `SHDButtonStyle` with a given button state style.
    ///
    /// - Parameter style: The `StyleButton` state to apply. Defaults to `.buttonDefault`.
    init(style: StyleButton = .buttonDefault) {
        self.style = style
    }

    // MARK: - ViewModifier

    /// Applies the style to the content by modifying its opacity according to the state.
    ///
    /// - Parameter content: The SwiftUI view representing the button.
    /// - Returns: A view with the opacity adjusted for the selected style.
    func body(content: Content) -> some View {
        content.opacity(style.opacity)
    }
}

// MARK: - View Extension

public extension View {

    /// Applies a `StyleButton` state to the view.
    ///
    /// - Parameter style: The button state to apply.
    /// - Returns: A view modified with the corresponding interaction state.
    ///
    /// ### Example
    /// ```swift
    /// SHDButton(label: "Continue") {
    ///     print("Button tapped")
    /// }
    /// .shdButtonStyle(.buttonLoading)
    /// ```
    public func shdButtonStyle(_ style: StyleButton) -> some View {
        modifier(SHDButtonStyle(style: style))
    }
}
