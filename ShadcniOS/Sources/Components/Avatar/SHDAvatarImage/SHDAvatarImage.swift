//
//  SHDAvatarImage.swift
//  ShadcniOS
//
//  Created by JoseAlvarez on 11/25/25.
//

import SwiftUI

/// Renders a resizable avatar image that keeps sizing and padding aligned with the design system.
///
/// ## Discussion
/// `SHDAvatarImage` wraps any SwiftUI `Image` and normalizes its padding, scaling, and clipping
/// based on the supplied `SHDAvatarSize`. The component does not assume a particular image source:
/// callers can pass SF Symbols, asset images, or remote placeholders. The component automatically
/// applies appropriate padding and clipping to maintain visual consistency across the library.
///
/// Creates an avatar image with the provided visual and sizing parameters.
///
/// - Parameters:
///   - image: The `Image` to render—can be an asset, symbol, or remote placeholder.
/// - Note: Use `.imagePadding(_:)` to set the avatar sizing preset that determines padding and layout.
///
/// ## Usage
/// ```swift
/// SHDAvatarImage(image: Image("profile-photo"))
///     .imagePadding(.lg)
/// ```
internal struct SHDAvatarImage: View {

    var image: Image
    var size: SHDAvatarSize = .md

    init(image: Image) {
        self.image = image
    }

    var body: some View {
        VStack {
            image
                .resizable()
                .scaledToFit()
                .padding(size.imagePadding)
                .backgroundColor(.textDimmed)
                .clipShape(RoundedRectangle(cornerRadius: .full))
        }
    }

    /// Returns a copy of the AvatarImage configured with a differnt size in a single call.
    ///
    /// Use this convenience builder when you want to update layout.
    ///
    /// - Parameters:
    ///   - size: The `SHDAvatarSize` to apply, controlling the avatar's frame and internal content scale.
    func imagePadding(_ size: SHDAvatarSize) -> Self {
        mutating(keyPath: \.size, value: size)
    }
}
