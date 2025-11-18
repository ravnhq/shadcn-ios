//
//  SHDButton.swift
//  ShadcniOS
//
//  Created by JoseAlvarez on 11/17/25.
//

import SwiftUI

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

    /// The display size of the icon. Defaults to `.md`.
    ///
    /// Use `.iconSize(_:)` to modify.
    var iconSize: SHDIconSize = .md

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
                    SHDIcon(leadingIcon)
                        .iconSize(iconSize)
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
}

#Preview {
    SHDButtonPreview()
}
