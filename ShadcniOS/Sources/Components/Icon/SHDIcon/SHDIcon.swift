//
//  SHDIcon.swift
//  ShadcniOS
//
//  Created by JoseAlvarez on 11/5/25.
//

import SwiftUI

/// A scalable and customizable icon used throughout the ShadcniOS design system.
///
/// ### Discussion
/// `SHDIcon` displays vector or bitmap assets from the design token set (`SHDIconAsset`).
/// It supports RTL layout flipping and consistent sizing defined by design tokens.
///
/// ### Usage
/// ```swift
/// SHDIcon(icon: .notificationBellRing)
/// SHDIcon(icon: .notificationCheck, size: .large, renderingMode: .original)
/// ```
public struct SHDIcon: View {
    // MARK: - Properties

    /// The icon asset to display.
    private let icon: SHDIconAssets

    /// The rendering mode used for displaying the image. Defaults to `.template`.
    private let renderingMode: Image.TemplateRenderingMode

    /// The size of the icon, following the design system scale.
    private let size: SHDIconSize

    // MARK: - Initializer

    /// Creates a new icon with a given asset, rendering mode, and size.
    ///
    /// - Parameters:
    ///   - icon: The design system icon asset.
    ///   - renderingMode: The rendering mode for the icon (default: `.template`).
    ///   - size: The icon size variant (default: `.medium`).
    public init(
        icon: SHDIconAssets,
        renderingMode: Image.TemplateRenderingMode = .template,
        size: SHDIconSize = .md
    ) {
        self.icon = icon
        self.renderingMode = renderingMode
        self.size = size
    }

    // MARK: - Body

    public var body: some View {
        Image(icon.rawValue, bundle: .module)
            .resizable()
            .renderingMode(renderingMode)
            .flipsForRightToLeftLayoutDirection(true)
            .frame(width: size.rawValue, height: size.rawValue)
            .accessibilityHidden(true)
    }
}
