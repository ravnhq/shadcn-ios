//
//  SHDVariantButton.swift
//  ShadcniOS
//
//  Created by JoseAlvarez on 11/17/25.
//

import Foundation

/// A semantic set of visual variants used to style ShadcniOS buttons.
///
/// ## Discussion
/// `SHDButtonVariant` defines all visual button styles available in the
/// ShadcniOS design system.
///
/// Each variant controls:
/// - background color
/// - foreground (text + icon) color
/// - border color (only for outline)
///
/// All colors are sourced from the ShadcniOS design system token set.
///
/// ## Usage
///
/// Accessing variant colors:
/// ```swift
/// let variant: SHDButtonVariant = .secondary
/// let bg = variant.backgroundColor
/// let fg = variant.foregroundColor
/// ```
///
/// Applying a variant to a custom view:
/// ```swift
/// someView
///     .background(variant.backgroundColor.color)
///     .foregroundColor(variant.foregroundColor.color)
/// ```
///
/// Using a variant with the unified ShadcniOS button modifier:
/// ```swift
/// SHDButton(label: "Delete") { }
///     .buttonVariant(variant: .destructive)
/// ```
public enum SHDButtonVariant {

    /// The primary emphasized button style.
    case `default`

    /// A lower-emphasis alternative to the primary style.
    case secondary

    /// A styling for destructive or irreversible user actions.
    case destructive

    /// A neutral button with a visible border and clear background.
    case outline

    /// A minimal button with no background or border.
    case ghost

    /// A text-only, inline-style action.
    case link

    var backgroundColor: SHDColor {
        switch self {
        case .default: .backgroundPrimaryDefault
        case .secondary: .backgroundPrimaryLight
        case .destructive: .backgroundDestructiveDefault
        case .outline, .ghost, .link: .clear
        }
    }

    var foregroundColor: SHDColor {
        switch self {
        case .default: .foregroundPrimaryDefault
        case .secondary: .foregroundAccent
        case .destructive: .foregroundPrimaryDefault
        case .outline, .ghost, .link: .foregroundDefault
        }
    }

    var borderColor: SHDColor {
        switch self {
        case .outline: .borderPrimaryDefault
        default: .clear
        }
    }
}
