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
///     .AvatarInitialsVariant(.outline)
/// ```
internal struct SHDAvatarInitials: View {

    /// The initials or short text that will be rendered inside the avatar circle.
    var text: String

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
    }
}
