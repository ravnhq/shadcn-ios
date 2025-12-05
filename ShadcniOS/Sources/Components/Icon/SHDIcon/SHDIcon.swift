//
//  SHDIcon.swift
//  ShadcniOS
//
//  Created by JoseAlvarez on 11/5/25.
//

import SwiftUI

/// A view that displays an icon from the Shadcn iOS design system.
///
/// ## Discussion
/// `SHDIcon` renders icons from the `SHDIconAsset` enum, providing consistent
/// iconography throughout the application. Icons are automatically sized and
/// can be customized using the `.iconSize(_:)` modifier.
///
/// Creates a new `SHDIcon` instance.
///
/// - Parameters:
///   - icon: The design system icon asset.
///
/// ## Usage
/// ```swift
/// SHDIcon(.notificationBellRing)
///     .iconSize(.md)
/// ```
internal struct SHDIcon: View {

    private let icon: SHDIconAsset
    private var size: SHDIconSize = .md

    init(_ icon: SHDIconAsset) {
        self.icon = icon
    }

    var body: some View {
        Image(icon.rawValue, bundle: .module)
            .resizable()
            .renderingMode(.template)
            .flipsForRightToLeftLayoutDirection(true)
            .frame(width: size.rawValue, height: size.rawValue)
    }

    /// Sets the size of the icon.
    ///
    /// - Parameters:
    ///   - size: A value from `SHDIconSize`.
    /// - Returns: A new `SHDIcon` view with the updated size.
    func iconSize(_ size: SHDIconSize) -> some View {
        mutating(keyPath: \.size, value: size)
    }
}

#Preview("SHDIcon - Sizes") {
    HStack(spacing: 16) {
        SHDIcon(.notificationBellRing)
            .iconSize(.sm)

        SHDIcon(.notificationBellRing)

        SHDIcon(.notificationBellRing)
            .iconSize(.lg)
    }
    .padding()
    .previewLayout(.sizeThatFits)
}
