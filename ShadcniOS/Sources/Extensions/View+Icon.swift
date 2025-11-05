//
//  View+Icon.swift
//  ShadcniOS
//
//  Created by JoseAlvarez on 11/4/25.
//

import SwiftUI

// MARK: - SwiftUI Extensions

public extension View {

    /// Adds a leading custom icon before the current view.
    ///
    /// Example:
    /// ```swift
    /// Text("Settings")
    ///     .icon(.iconAlert, size: 20, color: .blue)
    /// ```
    ///
    /// - Parameters:
    ///   - icon: The icon to display.
    ///   - size: Font size for the icon glyph.
    ///   - color: Foreground color for the icon.
    ///   - fontName: The font name registered via ``FontLoader``.
    /// - Returns: A new view containing the icon and the original view content.
    func icon(
        _ icon: SHDIcon,
        size: CGFloat = 24,
        color: SHDColor = .iconPrimaryDefault,
        fontName: String = SHDFont.accessibility.rawValue
    ) -> some View {
        HStack(spacing: 4) {
            Text(icon.rawValue)
                .font(.custom(fontName, size: size))
                .foregroundColor(color)
            self
        }
    }
}

// MARK: - Convenience Icon View

/// A standalone view for rendering a single icon glyph.
///
/// Works similarly to `Image(systemName:)` but uses the custom
/// icon font registered through ``FontLoader``.
///
/// Example:
/// ```swift
/// Icon(.iconAlert, size: 32)
///     .foregroundColor(.pink)
/// ```
public func Icon(
    _ icon: SHDIcon,
    size: CGFloat = 24,
    fontName: String = SHDFont.accessibility.rawValue
) -> some View {
    Text(icon.rawValue)
        .font(.custom(fontName, size: size))
}
