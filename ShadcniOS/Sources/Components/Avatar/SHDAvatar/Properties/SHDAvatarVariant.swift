//
//  SHDAvatarImageVariant.swift
//  ShadcniOS
//
//  Created by JoseAlvarez on 11/25/25.
//

/// A visual style description for `SHDAvatar`, controlling how the component draws its background,
/// foreground, and optional border.
///
/// ## Discussion
/// `SHDAvatarVariant` encapsulates the design language for the avatar component, making it easy to
/// align the control with brand guidelines. Each case defines a coordinated set of colors that
/// react appropriately to light and dark backgrounds while also ensuring accessibility contrast.
///
/// ## Usage
/// ```swift
/// VStack {
///     SHDAvatar(icon: .notificationCheckCheck)
///         .avatarStyle(variant: .light)
/// }
/// ```
public enum SHDAvatarVariant {

    /// Lightweight treatment that preserves the parent background and uses the default foreground color.
    case light
    /// High-emphasis treatment that fills the avatar with the primary
    /// background color and inverts the foreground.
    case filled
    /// Minimal treatment that draws a stroke to outline the avatar, keeping the background transparent.
    case outline

    var backgroundColor: SHDColor {
        switch self {
        case .light: .backgroundPrimaryLight
        case .filled: .backgroundPrimaryDefault
        case .outline: .clear
        }
    }

    var foregroundColor: SHDColor {
        switch self {
        case .light: .foregroundDefault
        case .filled: .foregroundPrimaryDefault
        case .outline: .foregroundDefault
        }
    }

    var borderColor: SHDColor {
        switch self {
        case .outline: .borderPrimaryDefault
        default: .clear
        }
    }
}
