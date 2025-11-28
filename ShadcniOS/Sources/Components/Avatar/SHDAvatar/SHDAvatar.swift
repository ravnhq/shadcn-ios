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
///     .shdAvatarStyle(.lg, .filled)
///
/// SHDAvatar(text: "JD")
///     .shdAvatarStyle(.sm, .outline)
/// ```
public struct SHDAvatar: View {

    /// Optional user photo rendered at the selected size when available.
    var image: Image?
    /// Icon fallback used when no image is provided.
    var icon: SHDIconAsset?
    /// Two-character initials shown when both `image` and `icon` are `nil`.
    var text: String?
    /// Controls the avatar's frame and internal typography/icon scale, default in medium = `.md`
    var size: SHDAvatarSize = .md

    /// Visual treatment applied to images or initials (e.g., filled or outline), default in `.light`
    var variant: SHDAvatarVariant = .light

    /// Creates an avatar by specifying the desired content source, size, and visual variant.
    ///
    /// - Parameters:
    ///   - image: The `Image` to display when a photo is available.
    ///   - icon: A fallback `SHDIconAsset` used when no image is provided.
    ///   - text: Two-character initials rendered when both `image` and `icon` are `nil`.
    public init(
        image: Image? = nil,
        icon: SHDIconAsset? = nil,
        text: String? = nil,
    ) {
        self.image = image
        self.icon = icon
        self.text = text
    }

    public var body: some View {
        VStack {
            if let image = image {
                SHDAvatarImage(image: image, size: size)
            } else if let icon = icon {
                SHDAvatarIcon(
                    icon: icon,
                    size: size
                )
                .shdAvatarIconVariant(variant)
            } else if let text = text {
                if text.count == 2 {
                    SHDAvatarInitials(text: text, size: size)
                        .shdAvatarInitialsVariant(variant)
                }
            }
        }
        .frame(width: size.size, height: size.size)
        .clipped()
    }

    /// Returns a copy of the avatar configured with both size and visual variant in a single call.
    ///
    /// Use this convenience builder when you want to update layout and styling together instead of
    /// chaining `shdAvatarSize(_:)` and `shdAvatarVariant(_:)` separately.
    ///
    /// - Parameters:
    ///   - size: The `SHDAvatarSize` to apply, controlling the avatar's frame and internal content scale.
    ///   - variant: The `SHDAvatarVariant` to apply, defining the visual treatment (e.g., filled or outline).
    /// - Returns: A copy of `SHDAvatar` whose `size` and `variant`
    /// properties are updated to the provided values.
    public func shdAvatarStyle(size: SHDAvatarSize = .md, variant: SHDAvatarVariant = .light) -> Self {
        mutating { style in
            style.size = size
            style.variant = variant
        }
    }
}

#Preview {
    SHDAvatarPreview()
}
