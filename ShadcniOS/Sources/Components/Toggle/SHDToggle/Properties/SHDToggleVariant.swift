//
//  SwiftUIView.swift
//  ShadcniOS
//
//  Created by Diego Takaki on 12/29/25.
//

import Foundation

/// A visual style variant for toggle components.
///
/// ## Discussion
///
/// `SHDToggleVariant` defines the appearance of toggle buttons by controlling their
/// background color, border, and foreground styling. Each variant provides a distinct
/// visual representation suitable for different UI contexts.
///
/// ## Usage
///
/// Choose a variant based on your toggle's purpose and visual hierarchy:
///
///``` swift
///SHDToggle(
///     isActive: $isActive,
///     label: "Label + Icon",
///     icon: .arrowChevronDown
///)
///.toggleVariant(variant: toggleVariant, size: toggleSize)
///```
public enum SHDToggleVariant {

    /// The default toggle variant with a clear background and no border.
    case `default`

    /// An outlined toggle variant with a visible border and clear background.
    case outline

    /// An active toggle variant with a secondary background color.
    case active

    var backgroundColor: SHDColor {
        switch self {
        case .default, .outline: .clear
        case .active: .backgroundSecondaryDefault
        }
    }

    var borderColor: SHDColor {
        switch self {
        case .outline: .borderPrimaryDefault
        default: .clear
        }
    }

    var foregroundColor: SHDColor {
        .foregroundAccent
    }
}
