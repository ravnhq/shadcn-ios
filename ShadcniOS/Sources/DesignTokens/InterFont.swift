//
//  InterFont.swift
//  ShadcniOS
//
//  Created by JoseAlvarez on 11/7/25.
//

import CoreText
import SwiftUI

/// A wrapper for the Inter font family that handles registration and weight mapping.
///
/// ## Discussion
/// This struct ensures the `Inter.ttf` font is registered exactly once and provides
/// convenient access to the font weights through static properties.
internal struct InterFont {

    /// The logical font name representing a specific weight/style.
    let fontName: String

    /// Creates a new `InterFont` instance and ensures the font is registered.
    ///
    /// - Parameters:
    ///   - name: The logical font name, e.g., `"Inter-Regular_Bold"`.
    private init(name: String) {
        self.fontName = name
        registerInterFont()
    }

    /// Registers the Inter font once in a thread-safe manner.
    /// Accessing this func ensures the font file is available for use.
    private func registerInterFont() {
        do {
            try FontLoader.registerFont(named: "Inter", withExtension: "ttf")
        } catch {
            print(
                ":warning: Failed to register font 'Inter': \(error.localizedDescription)"
            )
        }
    }
}
extension InterFont {
    static let regularThin = InterFont(name: "Inter-Regular_Thin")
    static let regularExtraLight = InterFont(name: "Inter-Regular_ExtraLight")
    static let regularLight = InterFont(name: "Inter-Regular_Light")
    static let regular = InterFont(name: "Inter-Regular")
    static let regularMedium = InterFont(name: "Inter-Regular_Medium")
    static let regularSemiBold = InterFont(name: "Inter-Regular_SemiBold")
    static let regularBold = InterFont(name: "Inter-Regular_Bold")
    static let regularExtraBold = InterFont(name: "Inter-Regular_ExtraBold")
    static let regularBlack = InterFont(name: "Inter-Regular_Black")
}
