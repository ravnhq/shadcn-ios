//
//  SHDIcon.swift
//  ShadcniOS
//
//  Created by JoseAlvarez on 11/5/25.
//

import SwiftUI

internal struct SHDIcon: View {

    // MARK: - Properties

    /// The icon asset to display.
    private let icon: SHDIconAsset

    /// The icon size. Defaults to `.md`.
    private var size: SHDIconSize = .md

    // MARK: - Initializer

    /// Creates a new `SHDIcon` instance.
    ///
    /// - Parameter icon: The design system icon asset.
    init(_ icon: SHDIconAsset) {
        self.icon = icon
    }

    // MARK: - Body

    var body: some View {
        Image(icon.rawValue, bundle: .module)
            .resizable()
            .renderingMode(.template)
            .flipsForRightToLeftLayoutDirection(true)
            .frame(width: size.rawValue, height: size.rawValue)
    }

    // MARK: - Modifiers

    /// Sets the size of the icon.
    ///
    /// - Parameter size: A value from `SHDIconSize`.
    /// - Returns: A new `SHDIcon` view with the updated size.
    func iconSize(_ size: SHDIconSize) -> some View {
        mutating(keyPath: \.size, value: size)
    }
}

// MARK: - Preview

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
