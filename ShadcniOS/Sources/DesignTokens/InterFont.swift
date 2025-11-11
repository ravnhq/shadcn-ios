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
/// This struct ensures the `Inter.ttf` font is registered exactly once and provides
/// convenient access to the font weights through static properties.
internal struct InterFont {

    /// The logical font name representing a specific weight/style.
    let fontName: String

    /// Registers the Inter font once in a thread-safe manner.
    /// Accessing this property ensures the font file is available for use.
    private static let registerOnce: Void = {
        do {
            try FontLoader.registerFont(named: "Inter", withExtension: "ttf")
        } catch {
            print("⚠️ Failed to register font 'Inter': \(error.localizedDescription)")
        }
    }()

    /// Creates a new `InterFont` instance and ensures the font is registered.
    ///
    /// - Parameter name: The logical font name, e.g., `"Inter-Regular_Bold"`.
    private init(name: String) {
        _ = Self.registerOnce
        self.fontName = name
    }

    /// Returns the corresponding `Font.Weight` for the logical font name.
    ///
    /// This mapping allows the use of a single `Inter.ttf` file for all weights while
    /// providing semantic access to standard SwiftUI font weights.
    var weight: Font.Weight {
        switch fontName {
        case "Inter-Regular_Thin": return .ultraLight
        case "Inter-Regular_ExtraLight": return .thin
        case "Inter-Regular_Light": return .light
        case "Inter-Regular": return .regular
        case "Inter-Regular_Medium": return .medium
        case "Inter-Regular_SemiBold": return .semibold
        case "Inter-Regular_Bold": return .bold
        case "Inter-Regular_ExtraBold": return .heavy
        case "Inter-Regular_Black": return .black
        default: return .regular
        }
    }
}

internal extension InterFont {
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
