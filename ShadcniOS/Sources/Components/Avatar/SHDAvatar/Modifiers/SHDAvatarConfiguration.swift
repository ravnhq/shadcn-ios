//
//  SHDAvatarConfiguration.swift
//  ShadcniOS
//
//  Created by JoseAlvarez on 11/28/25.
//

import SwiftUI

/// A SwiftUI modifier that normalizes avatar icon typography, spacing, and colors.
///
/// ## Discussion
/// Use `SHDAvatarConfiguration` internally to enforce a consistent look-and-feel across all
/// avatar variants. The modifier sets the text style, applies the appropriate paddings, scales
/// text to fit, and paints the background, foreground, and border based on the provided variant.
///
/// ## Usage
/// ```swift
/// SHDAvatar(text: "ND")
///     .avatarStyle(size: .sm, variant: .light)
/// ```
internal struct SHDAvatarConfiguration: ViewModifier {

    /// The color and border palette applied to the avatar.
    var variant: SHDAvatarVariant = .light

    /// The sizing token that maps to text style, padding, and corner radius.
    var size: SHDAvatarSize = .md

    /// Returns the content styled according to the supplied avatar variant and size.
    func body(content: Content) -> some View {
        content
            .minimumScaleFactor(0.01)
            .textStyle(size.textStyle)
            .padding(.all, size.textPadding)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .backgroundColor(variant.backgroundColor)
            .foregroundColor(variant.foregroundColor)
            .overlay {
                RoundedRectangle(cornerRadius: .full)
                    .stroke(
                        variant.borderColor.color,
                        lineWidth: variant.borderColor == .clear ? 0 : 1
                    )
            }
            .clipShape(RoundedRectangle(cornerRadius: .full))
    }
}

internal extension View {

    /// Applies the avatar configuration modifier to the receiving view.
    ///
    /// ## Discussion
    /// Use this helper when building avatar subviews to keep the call site terse while still
    /// exposing the variant and size knobs.
    ///
    /// ## Usage
    /// ```swift
    /// SHDAvatar(icon: .notificationBellRing)
    ///     .avatarStyle(variant: .light)
    /// ```
    ///
    /// - Parameters:
    ///   - variant: The appearance token that determines background, foreground, and border colors.
    ///   - size: The sizing token that controls typography and layout.
    /// - Returns: A view configured with avatar styling.
    func avatarVariant(variant: SHDAvatarVariant = .light, size: SHDAvatarSize = .md) -> some View {
        modifier(SHDAvatarConfiguration(variant: variant, size: size))
    }
}

#Preview {
    SHDAvatarPreview()
}
