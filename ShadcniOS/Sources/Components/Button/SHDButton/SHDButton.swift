//
//  SHDButton.swift
//  ShadcniOS
//
//  Created by JoseAlvarez on 11/17/25.
//

import SwiftUI

/// A flexible, composable button used throughout the ShadcniOS design system.
///
/// ## Discussion
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
/// Layout rules:
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
/// Creates a ShadcniOS button.
///
/// - Parameters:
///   - label: Optional text. If `nil`, the button becomes icon-only.
///   - icon: Optional leading icon.
///   - action: Closure executed on tap.
///
///
/// ## Usage
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

    @Environment(\.isLoading) private var isLoading

    private var variant: SHDButtonVariant = .default
    private var size: SHDButtonSize = .md
    private let text: String?
    private let leadingIcon: SHDIconAsset?
    private let onTap: () -> Void

    public init(
        label: String? = nil,
        icon: SHDIconAsset? = nil,
        action: @escaping () -> Void
    ) {
        self.text = label
        self.leadingIcon = icon
        self.onTap = action
    }

    public var body: some View {
        Button(action: onTap) {
            HStack(spacing: .sm) {
                if let leadingIcon {
                    if isLoading {
                        SHDLoadingIcon()
                            .iconSize(size.iconSize)
                    } else {
                        SHDIcon(leadingIcon)
                            .iconSize(size.iconSize)
                    }
                }

                if let text {
                    Text(text)
                        .textStyle(size.textSize)
                }
            }
            .padding(.vertical, .xxs)
            .padding(.horizontal, text != nil ?  .sm : .xxs)
            .backgroundColor(variant.backgroundColor)
            .opacity(isLoading ? 0.5 : 1.0)
            .foregroundColor(variant.foregroundColor)
            .overlay(overlay)
            .cornerRadius(.md)
        }
        .baseButtonStyle()
        .disabled(isLoading)
    }

    private var overlay: some View {
        RoundedRectangle(cornerRadius: .md)
            .stroke(
                variant.borderColor.color,
                lineWidth: variant.borderColor == .clear ? 0 : 1
            )
    }

    /// Applies unified ShadcniOS button variant and size styling.
    ///
    /// - Parameters:
    ///   - variant: The color and border configuration.
    ///   - size: The typography size of the button.
    /// - Returns: A view styled according to the ShadcniOS design system.
    public func buttonVariant(variant: SHDButtonVariant, size: SHDButtonSize) -> some View {
        mutating { button in
            button.variant = variant
            button.size = size
        }
    }
}

#Preview {
    SHDButtonPreview()
}
