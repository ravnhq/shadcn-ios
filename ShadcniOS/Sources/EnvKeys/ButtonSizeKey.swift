//
//  ButtonSizeKey.swift
//  ShadcniOS
//
//  Created by JoseAlvarez on 11/20/25.
//

import SwiftUI

/// An environment key used to store and retrieve the default button size
/// within the Shadcn iOS design system.
///
/// ### Discussion
/// `SHDButtonSizeKey` allows views to access or override the size of
/// Shadcn-based buttons using SwiftUI's environment system.
///
/// This enables size inheritance across view hierarchies, ensuring
/// consistent sizing without manually passing parameters into every
/// button.
///
/// The default value is `.md`, but any view can override it using:
/// ```swift
/// environment(\.shdButtonSize, .lg)
/// ```
///
/// ### Usage
///
/// Setting a global size for all buttons inside a container:
/// ```swift
/// VStack {
///     SHDButton("Confirm")
///     SHDButton("Cancel")
/// }
/// .environment(\.shdButtonSize, .lg)
/// ```
///
/// Reading the size inside a custom button:
/// ```swift
/// @Environment(\.shdButtonSize) private var size
///
/// var body: some View {
/// SHDLoadingIcon()
///    .iconSize(size.iconSize)
/// }
/// ```
private struct SHDButtonSizeKey: EnvironmentKey {

    // MARK: Default Value

    /// The default button size applied when no explicit value is set.
    ///
    /// The default is `.md`, representing the medium button variant.
    static let defaultValue: SHDSizeButton = .md
}

extension EnvironmentValues {

    // MARK: - Environment Value Accessor

    /// The size variant used by Shadcn buttons in the current environment.
    ///
    /// ### Discussion
    /// This value can be read or overridden to control button sizing across a view hierarchy.
    ///
    /// ### Usage
    /// Overriding the size for the subtree:
    /// ```swift
    /// environment(\.shdButtonSize, .sm)
    /// ```
    ///
    /// Reading the value inside a view:
    /// ```swift
    /// @Environment(\.shdButtonSize) var size
    /// ```
    var shdButtonSize: SHDSizeButton {
        get { self[SHDButtonSizeKey.self] }
        set { self[SHDButtonSizeKey.self] = newValue }
    }
}
