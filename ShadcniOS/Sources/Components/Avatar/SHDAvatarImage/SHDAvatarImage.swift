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
/// ## Usage
/// ```swift
/// SHDAvatarImage(image: Image("profile-photo"), size: .lg)
/// ```
struct SHDAvatarImage: View {

    /// The visual content displayed inside the avatar frame.
    var image: Image

    /// Controls intrinsic dimensions and internal padding for the avatar.
    var size: SHDAvatarSize = .md

    /// Creates an avatar image with the provided visual and sizing parameters.
    /// - Parameters:
    ///   - image: The `Image` to render—can be an asset, symbol, or remote placeholder.
    ///   - size: The avatar sizing preset that determines padding and layout.
    init(image: Image, size: SHDAvatarSize) {
        self.image = image
        self.size = size
    }

    /// The composed avatar view ready for embedding in SwiftUI layouts.
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
}
