//
//  Error.swift
//  ShadcniOS
//
//  Created by JoseAlvarez on 11/11/25.
//

import Foundation

// MARK: - Font Errors
/// Errors that can occur while loading and registering custom fonts in the module.
internal enum FontLoaderError: LocalizedError {

    /// Thrown when the specified font file cannot be found in the module bundle.
    ///
    /// - Parameter name: The name of the font file that was not found.
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
            return "Failed to register font '\(name)': \(underlyingError.localizedDescription)"
        }
    }
}
