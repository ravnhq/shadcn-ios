//
//  SHDInputOTPRegexKeyboard.swift
//  ShadcniOS
//
//  Created by JoseAlvarez on 12/26/25.
//

import SwiftUI

struct SHDInputOTPRegexKeyboard: ViewModifier {
    let pattern: SHDInputOTPRegex
    @Binding var text: String

    func body(content: Content) -> some View {
        content
            .keyboardType(keyboardType)
            .textInputAutocapitalization(.never)
            .autocorrectionDisabled()
    }

    private var keyboardType: UIKeyboardType {
        switch pattern {
        case .onlyNumbers:
            return .numberPad
        case .onlyLetters:
            return .alphabet
        case .onlyNumbersAndLetters, .custom:
            return .asciiCapable
        }
    }
}

extension View {
    func otpPattern(
        _ pattern: SHDInputOTPRegex,
        text: Binding<String>
    ) -> some View {
        modifier(SHDInputOTPRegexKeyboard(pattern: pattern, text: text))
    }
}
