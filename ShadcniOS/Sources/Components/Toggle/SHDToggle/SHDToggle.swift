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
/// Visual styling follows the ShadcniOS design system through modifiers:
/// - `.toggleVariant(variant:size:)`
///
/// ## Usage
///
/// Icon + text toggle:
/// ```swift
/// @State private var isActive = false
///
/// SHDToggle(
///     icon: .bookmark,
///     label: "Bookmark",
///     isActive: $isActive
/// )
/// .toggleVariant(size: .md)
/// ```
public struct SHDToggle: View {
    @Binding private var isActive: Bool

    private let activeVariant: SHDToggleVariant = .active
    private let icon: SHDIconAsset?
    private var size: SHDButtonSize = .md
    private let text: String?
    private var variant: SHDToggleVariant = .default

    private var currentVariant: SHDToggleVariant {
        isActive ? activeVariant : variant
    }

    private init(
        icon: SHDIconAsset?,
        text: String?,
        isActive: Binding<Bool>
    ) {
        self.text = text
        self.icon = icon
        _isActive = isActive
    }

    /// Creates a toggle with both label and icon.
    ///
    /// - Parameters:
    ///   - isActive: A binding to control the toggle state.
    ///   - label: The text to display.
    ///   - icon: The icon to display.
    public init(
        icon: SHDIconAsset,
        label: String,
        isActive: Binding<Bool>
    ) {
        self.init(
            icon: icon,
            text: label,
            isActive: isActive
        )
    }

    /// Creates a toggle with only a label.
    public init(
        label: String,
        isActive: Binding<Bool>
    ) {
        self.init(
            icon: nil,
            text: label,
            isActive: isActive
        )
    }

    /// Creates a toggle with only an icon.
    public init(
        icon: SHDIconAsset,
        isActive: Binding<Bool>
    ) {
        self.init(
            icon: icon,
            text: nil,
            isActive: isActive
        )
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
            .padding(.vertical, text != nil ? .xxs : .xs)
            .padding(.horizontal, .xs)
            .backgroundColor(currentVariant.backgroundColor)
            .foregroundColor(currentVariant.foregroundColor)
            .overlay(overlay)
            .cornerRadius(.md)
        }
        .baseButtonStyle()
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
        variant: SHDToggleVariant = .default,
        size: SHDButtonSize = .md
    ) -> some View {
        mutating { toggle in
            toggle.variant = variant
            toggle.size = size
        }
    }
}

#Preview {
    SHDTogglePreview()
}
