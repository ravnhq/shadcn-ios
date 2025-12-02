//
//  SHDAvatar.swift
//  ShadcniOS
//
//  Created by JoseAlvarez on 11/24/25.
//

import SwiftUI

/// A flexible avatar that renders a photo, icon, or user initials with predefined sizing and visual variants.
///
/// ## Discussion
/// `SHDAvatar` automatically chooses the first non-`nil` source among `image`, `icon`, and `text`.
/// When text is chosen, only two-character initials are rendered to avoid unexpected layouts.
/// The size parameter controls both the frame and the internal typography/icon scale, while the variant
/// adjusts styling such as fill/background treatments applied by the supporting modifiers.
///
/// ## Usage
/// ```swift
/// SHDAvatar(image: Image("profile_photo"))
///     .AvatarStyle(size: .lg, variant: .filled)
///
/// SHDAvatar(text: "JD")
///     .AvatarStyle(size: .sm, variant: .outline)
/// ```
public struct SHDAvatar: View {

    /// Controls the avatar's frame and internal typography/icon scale, default in medium = `.md`
    private var size: SHDAvatarSize = .md

    /// Visual treatment applied to images or initials (e.g., filled or outline), default in `.light`
    private var variant: SHDAvatarVariant = .light

    /// Optional user photo rendered at the selected size when available.
    private let image: Image?
    /// Icon fallback used when no image is provided.
    private let icon: SHDIconAsset?
    /// Two-character initials shown when both `image` and `icon` are `nil`.
    private let text: String?

    /// Creates an avatar by specifying the desired content source, size, and visual variant.
    ///
    /// - Parameters:
    ///   - image: The `Image` to display when a photo is available.
    ///   - icon: A fallback `SHDIconAsset` used when no image is provided.
    ///   - text: Two-character initials rendered when both `image` and `icon` are `nil`.
    public init(image: Image) {
        self.image = image
        self.icon = nil
        self.text = nil
    }

    public init(icon: SHDIconAsset) {
        self.image = nil
        self.icon = icon
        self.text = nil
    }

    public init(text: String) {
        self.image = nil
        self.icon = nil
        self.text = text
    }

    public var body: some View {
        content
            .frame(width: size.size, height: size.size)
            .clipped()
    }

    /// Conditionally renders avatar content based on available sources (image, icon, or text).
    /// Uses `@ViewBuilder` to allow returning different view types based on the conditional logic.
    @ViewBuilder
    private var content: some View {
        if let image = image {
            SHDAvatarImage(image: image)
                .imagePadding(size)
        } else if let icon = icon {
            SHDAvatarIcon(icon: icon)
                .iconSize(size)
                .avatarIconVariant(variant)
        } else if let text = text, text.count == 2 {
            SHDAvatarInitials(text: text)
                .textSize(size)
                .avatarInitialsVariant(variant)
        }
    }

    /// Returns a copy of the avatar configured with both size and visual variant in a single call.
    ///
    /// Use this convenience builder when you want to update layout and styling together.
    ///
    /// - Parameters:
    ///   - size: The `SHDAvatarSize` to apply, controlling the avatar's frame and internal content scale.
    ///   - variant: The `SHDAvatarVariant` to apply, defining the visual treatment (e.g., filled or outline).
    /// - Returns: A copy of `SHDAvatar` whose `size` and `variant`
    /// properties are updated to the provided values.
    public func avatarStyle(
        size: SHDAvatarSize = .md,
        variant: SHDAvatarVariant = .light
    ) -> Self {
        mutating { style in
            style.size = size
            style.variant = variant
        }
    }
}

#Preview {
    SHDAvatarPreview()
}
