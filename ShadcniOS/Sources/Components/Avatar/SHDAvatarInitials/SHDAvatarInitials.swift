//
//  SHDAvatarInitials.swift
//  ShadcniOS
//
//  Created by JoseAlvarez on 11/25/25.
//

import SwiftUI

/// A SwiftUI view that renders a fallback set of initials for an avatar.
///
/// ## Discussion
/// `SHDAvatarInitials` provides a lightweight alternative when an avatar image is unavailable
/// or still loading. The component automatically applies the text style that corresponds to the
/// configured `SHDAvatarSize`, ensuring visual consistency across the avatar system.
///
/// ## Usage
/// ```swift
/// SHDAvatarInitials(text: "JD")
///     .textSize(.md)
///     .shdAvatarInitialsVariant(.outline)
/// ```
internal struct SHDAvatarInitials: View {

    /// The initials or short text that will be rendered inside the avatar circle.
    var text: String

    /// The avatar size variant used to derive typography and layout metrics.
    var size: SHDAvatarSize = .md

    /// Creates a new initials-based avatar representation.
    ///
    /// - Parameters:
    ///   - text: The initials that should be displayed, typically two characters to match `SHDAvatar`.
    ///
    /// - Note: Use `.textSize(_:)` to set the avatar size configuration that controls typography.
    init(text: String) {
        self.text = text
    }

    var body: some View {
        Text(text)
            .textStyle(size.textStyle)
    }

    func textSize(_ size: SHDAvatarSize) -> Self {
        mutating(keyPath: \.size, value: size)
    }
}
