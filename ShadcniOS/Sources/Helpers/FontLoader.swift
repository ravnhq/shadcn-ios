//
//  FontLoader.swift
//  ShadcniOS
//
//  Created by JoseAlvarez on 11/7/25.
//

import CoreText
import UIKit

/// Handles registration of custom fonts bundled with the module.
internal struct FontLoader {

    /// Registers a font file located in the module bundle.
    ///
    /// - Parameters:
    ///   - name: The name of the font file without its extension.
    ///   - ext: The file extension (e.g. `"ttf"` or `"otf"`).
    /// - Throws: An error if the font cannot be found or registration fails.
    static func registerFont(named name: String, withExtension ext: String) throws {
        guard let url = Bundle.module.url(forResource: name, withExtension: ext)
        else {
            throw NSError(
                domain: "FontLoader",
                code: 0,
                userInfo: [NSLocalizedDescriptionKey: "Font not found"]
            )
        }

        var error: Unmanaged<CFError>?
        CTFontManagerRegisterFontsForURL(url as CFURL, .process, &error)

        if let error = error?.takeRetainedValue() {
            throw error
        }
    }
}
