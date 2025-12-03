//
//  SHDAvatarIcon.swift
//  ShadcniOS
//
//  Created by JoseAlvarez on 11/25/25.
//

import SwiftUI

/// `SHDAvatarIcon` renders the fallback icon shown inside an `SHDAvatar` whenever
/// no image or initials are available, ensuring consistent sizing and styling across the component library.
///
/// ## Discussion
/// This view automatically sizes the embedded `SHDIcon` to match the avatar's current size token,
/// applies the brand-compliant background color, and rounds the shape to a pill by default.
/// You typically never present `SHDAvatarIcon` on its own; instead it is composed inside `SHDAvatar`
/// to provide a graceful fallback state. `SHDAvatarIcon` always expects an icon asset, so callers must
/// decide whether to render the view based on their own fallback logic.
///
/// ## Usage
/// ```swift
/// SHDAvatarIcon(icon: .notificationBellRing)
///     .iconSize(.md)
/// ```
internal struct SHDAvatarIcon: View {

    /// Icon asset displayed at the center of the avatar. Provide the precise asset you want rendered.
    var icon: SHDIconAsset

    /// Avatar sizing token used to derive the icon size and overall frame constraints.
    var size: SHDAvatarSize = .md

    /// Creates a new `SHDAvatarIcon`.
    ///
    /// - Parameters:
    ///   - icon: Icon asset to display.
    ///
    /// - Note: Use `.iconSize(_:)` to set the avatar size token that drives the icon's visual scale.
    init(
        icon: SHDIconAsset
    ) {
        self.icon = icon
    }

    /// The composed SwiftUI hierarchy responsible for rendering the icon with the proper styling.
    var body: some View {
        VStack {
            SHDIcon(icon)
                .iconSize(size.iconSize)
                .padding(size.iconPadding)
        }
    }

    func iconSize(_ size: SHDAvatarSize) -> Self {
        mutating(keyPath: \.size, value: size)
    }
}
