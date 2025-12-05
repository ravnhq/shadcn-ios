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
///
/// Creates an avatar by specifying the desired content source, size, and visual variant.
///
/// - Parameters:
///   - image: The `Image` to display when a photo is available.
///   - icon: A fallback `SHDIconAsset` used when no image is provided.
///   - text: Two-character initials rendered when both `image` and `icon` are `nil`.
///
///
/// ## Usage
/// ```swift
/// SHDAvatar(image: Image("profile_photo"))
///     .avatarStyle(size: .lg, variant: .filled)
/// ```
public struct SHDAvatar: View {

    private let image: Image?
    private let icon: SHDIconAsset?
    private let text: String?

    private var size: SHDAvatarSize = .md
    private var variant: SHDAvatarVariant = .light

    /// Initializes an avatar with a photo image.
    ///
    /// Use this initializer when a user-provided or system-provided `Image` should be displayed
    /// as the avatar's primary content. When this is set, `icon` and `text` are ignored.
    ///
    /// - Parameters:
    ///     - image: The image to render inside the avatar.
    public init(image: Image) {
        self.image = image
        self.icon = nil
        self.text = nil
    }

    /// Initializes an avatar with an icon fallback.
    ///
    /// Use this initializer when no user photo is available but an icon representation exists.
    /// When this is set, `image` and `text` are ignored.
    ///
    /// - Parameters:
    ///     - icon: The `SHDIconAsset` to display in place of a photo.
    public init(icon: SHDIconAsset) {
        self.image = nil
        self.icon = icon
        self.text = nil
    }

    /// Initializes an avatar using text initials.
    ///
    /// Use this initializer when neither an image nor icon is available.
    /// Only two-character initials are rendered; longer or shorter strings are ignored at render time.
    ///
    /// - Parameters:
    ///     - text: A two-character string representing user initials.
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
            SHDIcon(icon)
                .iconSize(size.iconSize)
                .avatarVariant(variant: variant)
        } else if let text = text, text.count == 2 {
            Text(text)
                .avatarVariant(variant: variant, size: size)
        }
    }

    /// Returns a copy of the avatar configured with both size and visual variant in a single call.
    ///
    /// Use this convenience builder when you want to update layout and styling together.
    ///
    /// - Parameters:
    ///   - size: The `SHDAvatarSize` to apply, controlling the avatar's frame and internal content scale.
    ///   - variant: The `SHDAvatarVariant` to apply, defining the visual treatment (e.g., filled or outline).
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
