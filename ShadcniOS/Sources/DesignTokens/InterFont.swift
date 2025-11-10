//
//  InterFont.swift
//  ShadcniOS
//
//  Created by JoseAlvarez on 11/7/25.
//

import CoreText
import SwiftUI

/// Handles registration and configuration of the Inter font family.
internal struct InterFont {

    /// A shared instance referencing the Inter font family.
    static let fontName = InterFont(named: "Inter")

    /// The base font name.
    let name: String

    /// Initializes and registers the Inter font from the bundle.
    ///
    /// - Parameter fileName: The name of the font file (without extension).
    private init(named fileName: String) {
        self.name = "Inter"

        do {
            try FontLoader.registerFont(named: fileName, withExtension: "ttf")
        } catch {
            print(
                "⚠️ Failed to register font '\(fileName)': \(error.localizedDescription)"
            )
        }
    }

    /// Represents the available font weights for the Inter family.
    enum Weight: String, CaseIterable {
        case thin = "Inter-Regular_Thin"
        case extraLight = "Inter-Regular_ExtraLight"
        case light = "Inter-Regular_Light"
        case regular = "Inter-Regular"
        case medium = "Inter-Regular_Medium"
        case semibold = "Inter-Regular_SemiBold"
        case bold = "Inter-Regular_Bold"
        case extraBold = "Inter-Regular_ExtraBold"
        case black = "Inter-Regular_Black"

        /// The PostScript name associated with the font weight.
        var postScriptName: String {
            return self.rawValue
        }

        /// Maps a `Font.Weight` to the corresponding `InterFont.Weight`.
        ///
        /// - Parameter fontWeight: The system font weight.
        /// - Returns: The matching Inter font weight.
        static func from(_ fontWeight: Font.Weight) -> Weight {
            switch fontWeight {
            case .ultraLight: return .thin
            case .thin: return .extraLight
            case .light: return .light
            case .regular: return .regular
            case .medium: return .medium
            case .semibold: return .semibold
            case .bold: return .bold
            case .heavy: return .extraBold
            case .black: return .black
            default: return .regular
            }
        }
    }
}
