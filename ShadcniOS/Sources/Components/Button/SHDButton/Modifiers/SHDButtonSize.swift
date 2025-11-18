//
//  SHDButtonSize.swift
//  ShadcniOS
//
//  Created by JoseAlvarez on 11/17/25.
//

import SwiftUI

/// A view modifier that applies a size variant to a button based on `SizeButton`.
///
/// ### Discussion
/// `SHDButtonSize` adjusts the typography of a button's label according to
/// the size variant defined in the ShadcniOS design system. Each size variant
/// maps to a specific `SHDTextStyle` which controls the font size and weight.
///
/// Use the `shdButtonSize(_:)` view modifier to apply a size to any SwiftUI
/// button or view representing a button.
///
/// ### Usage
///
/// Applying a medium size:
/// ```swift
/// SHDButton(label: "Continue") {
///     print("Button tapped")
/// }
/// .shdButtonSize(.md)
/// ```
///
/// Applying a small size:
/// ```swift
/// SHDButton(label: "Cancel") {
///     print("Button tapped")
/// }
/// .shdButtonSize(.sm)
/// ```
///
/// Applying a large size:
/// ```swift
/// SHDButton(label: "Submit") {
///     viewModel.submitForm()
/// }
/// .shdButtonSize(.lg)
/// ```
struct SHDButtonSize: ViewModifier {

    // MARK: - Properties

    /// The size variant to apply to the button.
    let size: SizeButton

    // MARK: - ViewModifier

    /// Applies the text style corresponding to the selected button size.
    ///
    /// - Parameter content: The SwiftUI view representing the button.
    /// - Returns: A view with the text style adjusted for the selected size.
    func body(content: Content) -> some View {
        content
            .textStyle(size.textSize)
    }
}

// MARK: - View Extension

public extension View {

    /// Applies a `SizeButton` variant to the view.
    ///
    /// - Parameter size: The size variant to apply.
    /// - Returns: A view modified with the corresponding size.
    ///
    /// ### Example
    /// ```swift
    /// SHDButton(label: "Continue") {
    ///     print("Button tapped")
    /// }
    /// .shdButtonSize(.lg)
    /// ```
    func shdButtonSize(_ size: SizeButton) -> some View {
        modifier(SHDButtonSize(size: size))
    }
}
