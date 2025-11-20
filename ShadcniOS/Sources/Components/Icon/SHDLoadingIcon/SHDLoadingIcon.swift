//
//  SHDLoadingIcon.swift
//  ShadcniOS
//
//  Created by JoseAlvarez on 11/20/25.
//

import SwiftUI

internal struct SHDLoadingIcon: View {

    // MARK: - Properties

    /// The icon asset to display. Defaults to `.cursorLoadingCircle`.
    private let icon: SHDIconAsset = .cursorLoadingCircle

    /// The icon size. Defaults to `.md`.
    private var size: SHDIconSize = .md

    /// Angle value used by `rotationEffect` to animate the spinning icon.
    @State private var rotationAngle: Angle = .zero

    // MARK: - Body

    var body: some View {
        SHDIcon(icon)
            .iconSize(size)
            .rotationEffect(rotationAngle)
            .onAppear {
                withAnimation(.linear(duration: 2).repeatForever(autoreverses: false)) {
                    rotationAngle = .degrees(360)
                }
            }
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
        SHDLoadingIcon()
            .iconSize(.sm)

        SHDLoadingIcon()

        SHDLoadingIcon()
            .iconSize(.lg)
    }
    .padding()
    .previewLayout(.sizeThatFits)
}
