//
//  SHDToggle.swift
//  ShadcniOS
//
//  Created by Diego Takaki on 12/22/25.
//

import SwiftUI

/// A flexible, composable toggle button used for binary state controls in the ShadcniOS design system.
///
/// ## Discussion
/// `SHDToggle` provides a toggleable button that supports:
/// - text-only toggles
/// - icon-only toggles
/// - icon + text combinations
/// - active/inactive states with visual feedback
///
/// Common use cases include:
/// - Formatting controls (bold, italic, underline)
/// - Feature toggles (bookmarks, favorites, notifications)
/// - Selection indicators
///
/// Visual styling follows the ShadcniOS design system through modifiers:
/// - `.toggleVariant(variant:size:)`
/// - environment values like `buttonSize`
///
/// ## Usage
///
/// Text-only toggle:
/// ```swift
/// @State private var isItalic = false
///
/// SHDToggle(isActive: $isItalic, label: "Italic")
///     .toggleVariant()
/// ```
///
/// Icon-only toggle:
/// ```swift
/// @State private var isBookmarked = false
///
/// SHDToggle(isActive: $isBookmarked, icon: .bookmark)
///     .toggleVariant(variant: .outline)
/// ```
///
/// Icon + text toggle:
/// ```swift
/// @State private var isActive = false
///
/// SHDToggle(
///     isActive: $isActive,
///     label: "Bookmark",
///     icon: .bookmark
/// )
/// .toggleVariant(size: .md)
/// ```
public struct SHDToggle: View {

    @Binding private var isActive: Bool

    private var variant: SHDButtonVariant = .outline
    private var activeVariant: SHDButtonVariant = .default
    private var size: SHDButtonSize = .md
    private let text: String?
    private let icon: SHDIconAsset?

    // Private initializer used internally
    private init(
        isActive: Binding<Bool>,
        text: String?,
        icon: SHDIconAsset?
    ) {
        self._isActive = isActive
        self.text = text
        self.icon = icon
    }

    /// Creates a toggle with both label and icon.
    ///
    /// - Parameters:
    ///   - isActive: A binding to control the toggle state.
    ///   - label: The text to display.
    ///   - icon: The icon to display.
    public init(
        isActive: Binding<Bool>,
        label: String,
        icon: SHDIconAsset
    ) {
        self.init(isActive: isActive, text: label, icon: icon)
    }

    /// Creates a toggle with only a label.
    ///
    /// - Parameters:
    ///   - isActive: A binding to control the toggle state.
    ///   - label: The text to display.
    public init(
        isActive: Binding<Bool>,
        label: String
    ) {
        self.init(isActive: isActive, text: label, icon: nil)
    }

    /// Creates a toggle with only an icon.
    ///
    /// - Parameters:
    ///   - isActive: A binding to control the toggle state.
    ///   - icon: The icon to display.
    public init(
        isActive: Binding<Bool>,
        icon: SHDIconAsset
    ) {
        self.init(isActive: isActive, text: nil, icon: icon)
    }

    public var body: some View {
        Button {
            isActive.toggle()
        } label: {
                HStack(spacing: .sm) {
                    if let icon {
                        SHDIcon(icon)
                            .iconSize(size.iconSize)
                    }

                    if let text {
                        Text(text)
                            .textStyle(size.textSize)
                    }
                }
                .padding(.vertical, .xxs)
                .padding(.horizontal, text != nil ? .sm : .xxs)
                .backgroundColor(currentVariant.backgroundColor)
                .foregroundColor(currentVariant.foregroundColor)
                .overlay(overlay)
                .cornerRadius(.md)
            }
        .baseButtonStyle()
    }

    private var currentVariant: SHDButtonVariant {
        isActive ? activeVariant : variant
    }

    private var overlay: some View {
        RoundedRectangle(cornerRadius: .md)
            .stroke(
                currentVariant.borderColor.color,
                lineWidth: currentVariant.borderColor == .clear ? 0 : 1
            )
    }

    /// Applies unified ShadcniOS toggle variant and size styling.
    ///
    /// - Parameters:
    ///   - variant: The color and border configuration when inactive.
    ///   - activeVariant: The color and border configuration when active. Defaults to `.default`.
    ///   - size: The typography and icon size of the toggle.
    /// - Returns: A view styled according to the ShadcniOS design system.
    public func toggleVariant(
        variant: SHDButtonVariant = .outline,
        activeVariant: SHDButtonVariant = .default,
        size: SHDButtonSize = .md
    ) -> some View {
        mutating { toggle in
            toggle.variant = variant
            toggle.activeVariant = activeVariant
            toggle.size = size
        }
    }
}

#Preview {
    SHDTogglePreview()
}
