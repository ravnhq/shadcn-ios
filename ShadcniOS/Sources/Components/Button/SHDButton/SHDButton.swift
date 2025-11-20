//
//  SHDButton.swift
//  ShadcniOS
//
//  Created by JoseAlvarez on 11/17/25.
//

import SwiftUI

/// A customizable button component used throughout the ShadcniOS design system.
///
/// ### Discussion
/// `SHDButton` supports an optional text label and an optional leading icon.
/// Consumers can customize icon size and define the button’s tap action.
/// Styling for colors, borders, and interaction states should be configured
/// externally, typically through a modifier or via component composition.
///
/// This component adapts to different UI contexts, supporting:
/// - icon-only actions
/// - text buttons
/// - icon + text combinations
///
/// Padding and layout adjust automatically depending on whether
/// the text label is provided.
///
/// ### Usage
///
/// Basic usage:
/// ```swift
/// SHDButton(label: "Continue") {
///     print("Button tapped")
/// }
/// ```
///
/// With a leading icon:
/// ```swift
/// SHDButton(label: "Send", icon: .paperPlane) {
///     viewModel.sendMessage()
/// }
/// .iconSize(.lg)
/// ```
///
/// Icon-only usage:
/// ```swift
/// SHDButton(icon: .trash) {
///     viewModel.deleteItem()
/// }
/// ```
public struct SHDButton: View {

    // MARK: - Properties

    /// Optional text displayed inside the button.
    ///
    /// If `nil`, only the icon is shown (if provided).
    public let text: String?

    /// Optional icon displayed before the label text.
    public let leadingIcon: SHDIconAsset?

    /// Action executed when the button is tapped.
    public let onTap: () -> Void

    /// internal var to manage the style button
    /// focused on the loading state
    private var buttonStyle: SHDStyleButton = .buttonDefault

    /// State private var to handle the rotation animation when
    /// the Loading icon appears
    @State private var rotationAngle: Angle = .zero

    /// The display size of the icon. Defaults to `.md`.
    ///
    /// Use `.iconSize(_:)` to modify.
    private var iconSize: SHDIconSize = .md

    // MARK: - Initializer

    /// Creates a new button with optional text and an optional leading icon.
    ///
    /// - Parameters:
    ///   - label: The button’s text. If `nil`, the button becomes icon-only.
    ///   - icon: The leading icon, if any.
    ///   - action: Closure executed when the button is tapped.
    public init(
        label: String? = nil,
        icon: SHDIconAsset? = nil,
        action: @escaping () -> Void
    ) {
        self.text = label
        self.leadingIcon = icon
        self.onTap = action
    }

    // MARK: - View

    /// The button’s visual representation.
    public var body: some View {
        Button(action: onTap) {
            HStack(spacing: .sm) {
                if let leadingIcon {
                    /// Conditional to handle de different icons, buttonStyle
                    /// is setted as loading and there's no text
                    /// I will draw the icon using .cursorLoadingCircle image asset
                    ///  and will apply animation of infinity rotation
                    let shouldShowLoadingIcon = (buttonStyle == .buttonLoading && text == nil)
                    if shouldShowLoadingIcon {
                        SHDIcon(.cursorLoadingCircle)
                            .rotationEffect(rotationAngle)
                            .onAppear {
                                withAnimation(.linear(duration: 2).repeatForever(autoreverses: false)) {
                                    rotationAngle = .degrees(360)
                                }
                            }
                    } else {
                        /// Otherwise it's the normal icon that users share
                        SHDIcon(leadingIcon )
                            .iconSize(iconSize)
                    }
                }

                if let text {
                    Text(text)
                }
            }
            .padding(.horizontal, text != nil ? 16 : 8)
        }
    }

    // MARK: - Modifiers

    /// Sets the size of the leading icon.
    ///
    /// - Parameter iconSize: The new icon size value.
    /// - Returns: A modified `SHDButton` with the updated icon size.
    ///
    /// ### Example
    /// ```swift
    /// SHDButton(label: "Edit", icon: .edit) {
    ///     viewModel.edit()
    /// }
    /// .iconSize(.sm)
    /// ```
    public func iconSize(_ iconSize: SHDIconSize) -> Self {
        mutating(keyPath: \.iconSize, value: iconSize)
    }

    /// Sets the state as loading style
    ///
    /// - Parameter buttonStyle: The style to be applied
    /// - Returns: A modified `SHDButton` with the new style state
    ///
    /// ### Example
    /// ```swift
    /// SHDButton(icon: .notificationBellOff) {
    ///     viewModel.clearNotifications()
    /// }
    /// .buttonLoading()
    /// ```
    public func buttonLoading(_ buttonStyle: SHDStyleButton = .buttonLoading) -> Self {
        mutating(keyPath: \.buttonStyle, value: buttonStyle)
    }
}

#Preview {
    SHDButtonPreview()
}
