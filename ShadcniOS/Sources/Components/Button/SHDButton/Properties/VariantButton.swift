//
//  Variant.swift
//  ShadcniOS
//
//  Created by JoseAlvarez on 11/17/25.
//

import Foundation

/// A set of semantic visual variants used to style buttons in the ShadcniOS design system.
///
/// ### Discussion
/// `VariantButton` defines the different look & feel configurations available for ShadcniOS buttons.
/// Each variant conveys a specific intent within the interface—whether it represents a primary action,
/// a secondary alternative, a destructive operation, or a minimal inline action.
///
/// Variants automatically determine the background color, foreground color, and (when applicable)
/// border color. These values are sourced from the ShadcniOS color tokens.
///
/// ### Usage
///
/// Basic usage inside a custom button:
/// ```swift
/// let variant: VariantButton = .default
/// let background = variant.backgroundColor
/// let foreground = variant.foregroundColor
/// ```
///
/// Applying a destructive variant:
/// ```swift
/// let variant: VariantButton = .destructive
///
/// someView
///     .background(variant.backgroundColor.swiftUIColor)
///     .foregroundStyle(variant.foregroundColor.swiftUIColor)
/// ```
public enum VariantButton {

    // MARK: - Variants

    /// The primary button style — used for the main action on a screen.
    case `default`

    /// A lower-emphasis alternative to the primary style.
    case secondary

    /// A style for dangerous or destructive operations (e.g., delete).
    case destructive

    /// A bordered button with a neutral background.
    case outline

    /// A minimal button with no background or border.
    case ghost

    /// A text-only button styled as an inline action.
    case link

    // MARK: - Computed Properties

    /// The background color associated with the variant.
    ///
    /// - Note: Minimal variants (`.outline`, `.ghost`, `.link`) use `.clear` backgrounds.
    var backgroundColor: SHDColor {
        switch self {
        case .default: return .backgroundPrimaryDefault
        case .secondary: return .backgroundPrimaryLight
        case .destructive: return .backgroundDestructiveDefault
        default: return .clear
        }
    }

    /// The foreground color (text and icon color) associated with the variant.
    ///
    /// - Note: `link` and `ghost` variants default to neutral foreground tones.
    var foregroundColor: SHDColor {
        switch self {
        case .default: return .foregroundPrimaryDefault
        case .secondary: return .foregroundAccent
        case .destructive: return .foregroundPrimaryDefault
        case .outline: return .foregroundDefault
        case .ghost: return .foregroundDefault
        case .link: return .foregroundDefault
        default: return .clear
        }
    }

    /// The border color associated with the variant.
    ///
    /// - Note: Only the `.outline` variant provides a visible border color.
    var borderColor: SHDColor {
        switch self {
        case .outline: return .borderPrimaryDefault
        default: return .clear
        }
    }
}
