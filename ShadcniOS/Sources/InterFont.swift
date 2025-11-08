//
//  InterFont.swift
//  ShadcniOS
//
//  Created by JoseAlvarez on 11/7/25.
//

import CoreText
import SwiftUI

internal struct InterFont {
    static let variable = InterFont(named: "Inter")

    let name: String

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

    enum Weight: String, CaseIterable {
        case thin = "Inter-Regular_Thin"
        case extraLight = "Inter-Regular_ExtraLight"
        case light = "Inter-Regular_Light"
        case regular = "Inter-Regular"
        case medium = "Inter-Regular_Medium"
        case semiBold = "Inter-Regular_SemiBold"
        case bold = "Inter-Regular_Bold"
        case extraBold = "Inter-Regular_ExtraBold"
        case black = "Inter-Regular_Black"

        var postScriptName: String {
            return self.rawValue
        }

        static func from(_ fontWeight: Font.Weight) -> Weight {
            switch fontWeight {
            case .ultraLight:
                return .thin
            case .thin:
                return .extraLight
            case .light:
                return .light
            case .regular:
                return .regular
            case .medium:
                return .medium
            case .semibold:
                return .semiBold
            case .bold:
                return .bold
            case .heavy:
                return .extraBold
            case .black:
                return .black
            default:
                return .regular
            }
        }
    }
}
