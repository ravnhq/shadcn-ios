//
//  SHDIcon.swift
//  ShadcniOS
//
//  Created by JoseAlvarez on 11/5/25.
//

import SwiftUI

internal struct SHDIcon: View {

    // MARK: - Properties

    /// The design system icon asset to display.
    private let icon: SHDIconAsset

    // MARK: - Initializer

    /// Creates a new `SHDIcon` instance.
    ///
    /// - Parameter icon: The design system icon asset.
    init(icon: SHDIconAsset) {
        self.icon = icon
    }

    // MARK: - Body

    var body: some View {
        Image(icon.rawValue, bundle: .module)
            .resizable()
            .renderingMode(.template)
            .flipsForRightToLeftLayoutDirection(true)
    }
}

// MARK: - Preview

#Preview("SHDIcon - Sizes") {
    HStack(spacing: 16) {
        SHDIcon(icon: .notificationBellRing)
            .iconSize(.sm)
        SHDIcon(icon: .notificationBellRing)
            .iconSize(.md)
        SHDIcon(icon: .notificationBellRing)
            .iconSize(.lg)
    }
    .padding()
    .previewLayout(.sizeThatFits)
}
