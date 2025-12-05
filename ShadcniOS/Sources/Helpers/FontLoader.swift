//
//  FontLoader.swift
//  ShadcniOS
//
//  Created by JoseAlvarez on 11/7/25.
//

import CoreText
import SwiftUI
import UIKit

// MARK: - Font Errors
/// Errors that can occur while loading and registering custom fonts in the module.
///
/// ## Discussion
/// These errors are thrown when font files cannot be found or when font registration fails.
internal enum FontLoaderError: LocalizedError {
    /// Thrown when the specified font file cannot be found in the module bundle.
    ///
    /// - Parameters:
    ///   - name: The name of the font file that was not found.
    case fontNotFound(name: String)
    /// Thrown when the font exists but registration with CoreText fails.
    ///
    /// - Parameters:
    ///   - name: The name of the font that failed to register.
    ///   - underlyingError: The underlying error returned by CoreText during registration.
    case registrationFailed(name: String, underlyingError: Error)
    /// A localized, user-friendly description of the error.
    var errorDescription: String? {
        switch self {
        case .fontNotFound(let name):
            return "Font '\(name)' could not be found in the module bundle."
        case .registrationFailed(let name, let underlyingError):
            return
                "Failed to register font '\(name)': \(underlyingError.localizedDescription)"
        }
    }
}

// MARK: - Font Loader
/// Handles registration of custom fonts bundled with the module.
///
/// ## Discussion
/// The `FontLoader` provides a thread-safe way to register custom fonts
/// that are bundled with the module, ensuring they are available for use
/// throughout the application.
internal struct FontLoader {

    /// Registers a font file located in the module bundle.
    ///
    /// - Parameters:
    ///   - name: The name of the font file without its extension.
    ///   - ext: The file extension (e.g. `"ttf"` or `"otf"`).
    /// - Throws: A `FontLoaderError` if the font cannot be found or registration fails.
    static func registerFont(named name: String, withExtension ext: String) throws {
        let descriptor = CTFontDescriptorCreateWithNameAndSize(name as CFString, 0)
        var matched = CTFontDescriptorCreateMatchingFontDescriptor(descriptor, nil)

        if matched == nil {
            guard let url = Bundle.module.url(forResource: name, withExtension: ext) else {
            throw FontLoaderError.fontNotFound(name: name)
        }

            var error: Unmanaged<CFError>?
            CTFontManagerRegisterFontsForURL(url as CFURL, .process, &error)

            if let error = error?.takeRetainedValue() {
                throw FontLoaderError.registrationFailed(name: name, underlyingError: error)
            }
        }
    }
}
