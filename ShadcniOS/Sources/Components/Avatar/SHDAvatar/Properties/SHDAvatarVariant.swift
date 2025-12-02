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
///         .AvatarStyle(variant: .light)
///
///     SHDAvatar(icon: .notificationCheckCheck)
///         .AvatarStyle(variant: .filled)
///
///     SHDAvatar(icon: .notificationCheckCheck)
///         .AvatarStyle(variant: .outline)
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

    /// Background color associated with the variant.
    ///
    /// ## Discussion
    /// Use this color when rendering the avatar's background shape.
    /// For outline variants the background remains
    /// transparent to allow underlying content to show through.
    ///
    /// ## Usage
    /// ```swift
    /// SHDAvatarIcon(icon)
    ///     .backgroundColor(variant.backgroundColor)
    /// ```
    var backgroundColor: SHDColor {
        switch self {
        case .light: .backgroundPrimaryLight
        case .filled: .backgroundPrimaryDefault
        case .outline: .clear
        }
    }

    /// Foreground color applied to initials or glyphs.
    ///
    /// ## Discussion
    /// This color is tuned per variant to maintain contrast regardless of background choice.
    /// For example, the filled variant uses white text to pop against the darker fill.
    var foregroundColor: SHDColor {
        switch self {
        case .light: .foregroundDefault
        case .filled: .foregroundPrimaryDefault
        case .outline: .foregroundDefault
        }
    }

    /// Border color for the avatar outline.
    ///
    /// ## Discussion
    /// Only the outline variant draws a border; all other variants return `.clear`
    /// so no additional stroke is rendered.
    /// Apply this color to a stroke that matches the avatar's shape.
    var borderColor: SHDColor {
        switch self {
        case .outline: .borderPrimaryDefault
        default: .clear
        }
    }
}
