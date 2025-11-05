//
//  FontLoader.swift
//  ShadcniOS
//
//  Created by JoseAlvarez on 11/4/25.
//

import SwiftUI

// MARK: - FontLoader

/// Utility responsible for dynamically loading custom `.ttf` font files
/// from the Swift Package bundle (`Bundle.module`).
///
/// This loader registers the fonts at runtime using CoreText so they can be
/// used throughout the app via `.font(.custom("FontName", size:))`.
public struct FontLoader {

    /// Loads a single font file from the package bundle.
    ///
    /// - Parameter name: The font file name without extension (e.g., `"Accessibility"`).
    /// - Returns: `true` if the font was successfully registered, otherwise `false`.
    @discardableResult
    public static func loadFont(named name: String) -> Bool {
        guard let url = Bundle.module.url(forResource: name, withExtension: "ttf") else {
            return false
        }

        guard let dataProvider = CGDataProvider(url: url as CFURL),
              let font = CGFont(dataProvider) else {
            return false
        }

        var error: Unmanaged<CFError>?
        if !CTFontManagerRegisterGraphicsFont(font, &error) {
            if let cfError = error?.takeUnretainedValue() {
            }
            return false
        }

        return true
    }

    /// Loads multiple font files from the package bundle.
    ///
    /// - Parameter names: An array of font file names (without extensions).
    public static func loadFonts(_ names: [String]) {
        names.forEach { _ = loadFont(named: $0) }
    }

    /// Loads all fonts defined in the ``SHDFont`` enumeration.
    ///
    /// Call this once (e.g., in your app’s initialization) to register all
    /// custom fonts included in the Swift package.
    public static func loadAllFonts() {
        SHDFont.allCases.forEach { _ = loadFont(named: $0.rawValue) }
    }
}

// MARK: - SHDFont

/// Enumeration representing all available font resources in the package.
///
/// Extend this enum with additional cases as new fonts are added to
/// the package’s `Resources` directory.
public enum SHDFont: String, CaseIterable {
    /// The main accessibility/regular icon font.
    case accessibility = "Accessibility"

    // Example: add more fonts here if needed.
    // case cars = "Cars"
}
