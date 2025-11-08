//
//  FontLoader.swift
//  ShadcniOS
//
//  Created by JoseAlvarez on 11/7/25.
//

import CoreText
import UIKit

internal struct FontLoader {
    static func registerFont(named name: String, withExtension ext: String)
        throws
    {
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
