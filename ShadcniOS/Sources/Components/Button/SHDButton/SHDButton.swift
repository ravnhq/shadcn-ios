//
//  SHDButton.swift
//  ShadcniOS
//
//  Created by JoseAlvarez on 11/17/25.
//

import SwiftUI

/// A flexible, composable button used throughout the ShadcniOS design system.
///
/// ### Overview
/// `SHDButton` provides a lightweight button structure that supports:
/// - text-only buttons
/// - icon-only buttons
/// - icon + text combinations
///
/// Visual styling (colors, border, background, typography) is *not* handled
/// inside this component. Instead, it is applied externally through
/// design-system modifiers such as:
///
/// - `.buttonVariant(variant:size:)`
/// - `.iconSize(...)`
/// - environment values like `buttonSize`
///
/// This separation ensures predictable, centralized styling while allowing
/// `SHDButton` to manage only layout and content composition.
///
/// ### Loading Behavior
///
/// The button supports a loading state via the `isLoading` environment key:
///
/// - When loading **and** the button is **icon-only**,
///   the leading icon is replaced with `SHDLoadingIcon()`.
///
/// - When loading **and text is present**,
///   the text remains visible and the whole button reduces opacity to `0.5`.
///
/// - The button remains interactive unless disabled by `.disabled(...)`.
///
/// ### Layout Rules
///
/// - If the button has text:
///   - horizontal padding = `16`
///   - icon spacing = `.sm`
///
/// - If the button is icon-only:
///   - horizontal padding = `8`
///
/// Icon sizing is controlled through:
/// ```swift
/// buttonSize.iconSize
/// ```
/// supplied by the design-system environment.
///
///
/// ### Usage Examples
///
/// Text-only:
/// ```swift
/// SHDButton(label: "Continue") { }
///     .buttonVariant()
/// ```
///
/// With a leading icon:
/// ```swift
/// SHDButton(label: "Send", icon: .paperPlane) {
///     viewModel.sendMessage()
/// }
/// .buttonVariant(size: .md)
/// ```
///
/// Icon-only:
/// ```swift
/// SHDButton(icon: .trash) { }
///     .buttonVariant(variant: .ghost)
/// ```
///
/// Loading (using environment):
/// ```swift
/// SHDButton(label: "Save", icon: .check) { }
///     .environment(\.isLoading, true)
/// ```
public struct SHDButton: View {

    // MARK: - Properties

    /// Indicates whether this button should show loading behavior.
    @Environment(\.isLoading) private var isLoading

    /// Indicates whether the button is enabled.
    @Environment(\.isEnabled) private var isEnabled

    /// The current button size coming from the design system.
    @Environment(\.buttonSize) private var buttonSize

    /// Optional text displayed inside the button.
    ///
    /// If `nil`, the button may render as icon-only.
    public let text: String?

    /// Optional icon displayed before the label text.
    public let leadingIcon: SHDIconAsset?

    /// Closure executed when the button is tapped.
    public let onTap: () -> Void

    // MARK: - Initializer

    /// Creates a ShadcniOS button.
    ///
    /// - Parameters:
    ///   - label: Optional text. If `nil`, the button becomes icon-only.
    ///   - icon: Optional leading icon.
    ///   - action: Closure executed on tap.
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

    /// The visual representation of the button.
    public var body: some View {
        Button(action: onTap) {
            HStack(spacing: .sm) {
                // Leading icon or loading indicator
                if let leadingIcon {
                    if isLoading && text == nil {
                        SHDLoadingIcon()
                            .iconSize(buttonSize.iconSize)
                            .disabled(true)
                    } else {
                        SHDIcon(leadingIcon)
                            .iconSize(buttonSize.iconSize)
                    }
                }

                // Text label (if any)
                if let text {
                    Text(text)
                }
            }
            .padding(.horizontal, text != nil ?  .sm : .xxs)
            .opacity(isLoading ? 0.5 : 1)
        }
        .disabled(isLoading || !isEnabled)
    }
}

#Preview {
    SHDButtonPreview()
}
