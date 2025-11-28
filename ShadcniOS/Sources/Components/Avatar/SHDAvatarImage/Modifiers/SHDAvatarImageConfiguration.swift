//
//  SHDAvatarImageConfiguration.swift
//  ShadcniOS
//
//  Created by JoseAlvarez on 11/25/25.
//

import SwiftUI

/// Configures the base look-and-feel for an `SHDAvatarImage`.
///
/// ### Discussion
/// `SHDAvatarImageConfiguration` centralizes colors, borders, and clipping so that all avatar images
/// stay visually consistent across the design system. The modifier reads the provided `variant`
/// to derive background, foreground, and border hues, then applies a circular clip with an optional stroke.
///
/// ### Usage
/// ```swift
/// SHDAvatarImage(image: Image("profile-photo"), size: .md)
///     .shdAvatarImageVariant(.light) using the extension shown below
/// ```
struct SHDAvatarImageConfiguration: ViewModifier {

    /// Visual variant that drives background, foreground, and border styling.
    var variant: SHDAvatarVariant

    /// Applies the avatar styling to the supplied `content`.
    /// - Parameter content: The view representing the avatar image.
    /// - Returns: A view with consistent avatar background, foreground, and border treatment.
    func body(content: Content) -> some View {
        content
            .backgroundColor(variant.backgroundColor)
            .foregroundColor(variant.foregroundColor)
            .clipShape(RoundedRectangle(cornerRadius: .full))
            .overlay {
                Circle()
                    .stroke(
                        variant.borderColor.color,
                        lineWidth: variant.borderColor == .clear ? 0 : 1
                    )
            }
    }
}

extension View {

    /// Applies an `SHDAvatarImageConfiguration` modifier using the supplied variant.
    /// - Parameter variant: The avatar style to render. Defaults to `.filled`.
    /// - Returns: A view that adopts the corresponding avatar styling.
    /// - Note: This convenience keeps the syntax lightweight when styling avatars inline.
    /// ### Usage
    /// ```swift
    /// SHDAvatarImage(image: Image("profile-photo"), size: .md)
    ///     .shdAvatarImageVariant(.light)
    /// ```
    func shdAvatarImageVariant(_ variant: SHDAvatarVariant = .filled) -> some View {
        modifier(SHDAvatarImageConfiguration(variant: variant))
    }
}
