//
//  File.swift
//  ShadcniOS
//
//  Created by Samuel Cornejo on 2025-11-21.
//

import SwiftUI

/// `BaseButtonStyle` is a custom SwiftUI `ButtonStyle` designed for the ShadcniOS component library.
///
/// ## Discussion
/// This style aims to provide a lightweight and cohesive interaction pattern for all standard buttons
/// in the ShadcniOS design system. By abstracting press and disabled appearances, it helps maintain
/// visual consistency and accessibility throughout your app.
///
/// Features:
/// - Applies a subtle opacity change to the button when pressed, providing visual feedback.
/// - Integrates with `.disabledMask()` to render a visual mask when the button is disabled,
/// ensuring consistent disabled states across your interface.
///
/// ## Usage
/// Use the `.baseButtonStyle()` view modifier, or apply `buttonStyle(BaseButtonStyle())` directly:
/// ```swift
/// SHDButton("Action") { /* action */ }
///     .baseButtonStyle()
/// ```
struct BaseButtonStyle: ButtonStyle {
    // MARK: - View

    func makeBody(configuration: Configuration) -> some View {
        configuration
            .label
            .opacity(configuration.isPressed ? 0.8 : 1.0)
            .disabledMask()
    }
}

extension View {
    /// Applies the standard ShadcniOS base button style to the view.
    ///
    /// ## Discussion
    /// This modifier applies a custom button style that provides consistent visual feedback
    /// for press and disabled states, matching the ShadcniOS design system.
    ///
    /// - Returns: A view with the `BaseButtonStyle` applied.
    func baseButtonStyle() -> some View {
        buttonStyle(BaseButtonStyle())
    }
}
