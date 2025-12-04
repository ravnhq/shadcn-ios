//
//  SHDLoadingIcon.swift
//  ShadcniOS
//
//  Created by JoseAlvarez on 11/20/25.
//

import SwiftUI

/// A loading indicator icon that rotates continuously to indicate a loading state.
///
/// ## Discussion
/// `SHDLoadingIcon` displays a spinning icon to indicate that an operation is in progress.
/// The icon rotates continuously using a linear animation.
///
/// ## Usage
/// ```swift
/// SHDLoadingIcon()
///     .iconSize(.md)
/// ```
internal struct SHDLoadingIcon: View {

    @State private var rotationAngle: Angle = .zero

    private let icon: SHDIconAsset = .cursorLoadingCircle
    private var size: SHDIconSize = .md

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

    /// Sets the size of the loading icon.
    ///
    /// - Parameters:
    ///   - size: A value from `SHDIconSize`.
    /// - Returns: A new `SHDLoadingIcon` view with the updated size.
    func iconSize(_ size: SHDIconSize) -> some View {
        mutating(keyPath: \.size, value: size)
    }
}

#Preview("SHDLoadingIcon - Sizes") {
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
