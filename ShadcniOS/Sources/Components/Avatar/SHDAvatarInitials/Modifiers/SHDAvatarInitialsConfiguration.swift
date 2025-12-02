//
//  SHDAvatarInitialsConfiguration.swift
//  ShadcniOS
//
//  Created by JoseAlvarez on 11/25/25.
//

import SwiftUI

/// A view modifier that standardizes the styling for initials-based avatars.
///
/// ## Discussion
/// Apply this modifier to any view that should mimic the `SHDAvatarInitials` appearance. The
/// modifier enforces full-width/height layout, color styling, and circular clipping that
/// mirrors the main `SHDAvatar` component. Border visibility is automatically derived from the
/// selected variant, so consumers only specify the variant once.
///
/// ## Behavior
/// - Expands its content to the available space when possible.
/// - Applies the variant's background and foreground colors.
/// - Clips the content to a circle and optionally renders a 1pt border.
///
/// ## Configuration
/// Provide an `SHDAvatarVariant` to switch between visual treatments (e.g. `.filled`, `.outline`).
/// Border color and width are inferred from the variant, ensuring the modifier stays in sync with
/// any future design updates to the `SHDAvatarVariant` definition.
///
/// ## Usage
/// ```swift
/// SHDAvatarInitials(text: "JD", size: .md)
///     .AvatarInitialsVariant(.outline)
/// ```
internal struct SHDAvatarInitialsConfiguration: ViewModifier {

    /// Describes the color palette and border visibility for the avatar.
    var variant: SHDAvatarVariant

    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .backgroundColor(variant.backgroundColor)
            .foregroundColor(variant.foregroundColor)
            .clipShape(Circle())
            .overlay {
                Circle()
                    .stroke(
                        variant.borderColor.color,
                        lineWidth: variant.borderColor == .clear ? 0 : 1
                    )
            }
    }
}

internal extension View {

    /// Applies the standardized initials avatar styling to the receiver.
    ///
    /// ## Discussion
    /// Wrap any view—typically an `SHDAvatarInitials` instance—to inherit the avatar styling.
    /// When no variant is provided, the modifier defaults to the `.filled` appearance.
    ///
    /// ## Usage
    /// ```swift
    /// SHDAvatarInitials(text: "AL", size: .md)
    ///     .AvatarInitialsVariant(.filled)
    /// ```
    func avatarInitialsVariant(_ variant: SHDAvatarVariant = .filled) -> some View {
        modifier(SHDAvatarInitialsConfiguration(variant: variant))
    }
}
