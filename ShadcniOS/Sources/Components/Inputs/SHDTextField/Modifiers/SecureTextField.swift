//
//  SecureTextField.swift
//  ShadcniOS
//
//  Created by Concepción Orellana on 12/28/25.
//

import SwiftUI

/// A view modifier that configures a `SHDTextField` to display its contents as
/// secure (obscured) text, such as for passwords.
///
/// ### Overview
/// Applying `SecureTextField` to a view sets the `.isSecureField` environment value,
/// which instructs any nested
/// `SHDTextField` to render as a secure input field (hiding the entered text). When
/// secure entry is enabled, the component swaps the trailing icon for an eye/eye-off
/// toggle so users can reveal or hide the password inline.
public struct SecureTextField: ViewModifier {
    // MARK: Properties

    /// Determines whether the `SHDTextField` should be secure.
    let isSecure: Bool

    // MARK: View

    public func body(content: Content) -> some View {
        content
            .environment(\.isSecureField, isSecure)
    }
}

public extension View {
    /// Configures any nested `SHDTextField` to display as a secure (obscured) field, such as for passwords.
    ///
    /// ## Usage
    /// ```swift
    /// SHDTextField(placeholder: "Password", text: $password)
    ///     .inputStyle(.md)
    ///     .isSecure(true)
    /// ```
    ///
    /// - Parameter isSecure: A Boolean value indicating whether the text field should
    /// obscure its input. Defaults to
    /// `true`.
    /// - Returns: A view with the `.isSecureField` environment value set,
    /// affecting any nested `SHDTextField`.
    func isSecure(_ isSecure: Bool = true) -> some View {
        modifier(SecureTextField(isSecure: isSecure))
    }
}
