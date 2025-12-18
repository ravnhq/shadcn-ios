//
//  SHDTextInput.swift
//  ShadcniOS
//
//  Created by Concepción Orellana on 12/15/25.
//

import SwiftUI

/// A foundational text input used throughout the ShadcniOS design system.
///
/// ## Discussion
/// `SHDTextInput` provides a minimal, composable base for all input variants.
/// It accepts a bound text value, supports a placeholder, and applies the core
/// layout and surface styling expected by the design system.
///
/// ## Usage
/// ```swift
/// @State private var value = ""
/// SHDTextInput(text: $value, placeholder: "Email address")
/// ```
public struct SHDTextInput: View {
    @Binding private var text: String
    private let placeholder: String

    /// Creates a ShadcniOS text input.
    ///
    /// - Parameters:
    ///   - text: Bound text value for the field.
    ///   - placeholder: Placeholder text displayed when the input is empty.
    public init(
        text: Binding<String>,
        placeholder: String
    ) {
        _text = text
        self.placeholder = placeholder
    }

    public var body: some View {
        ZStack(alignment: .leading) {
            if text.isEmpty {
                Text(placeholder)
                    .textStyle(.textBaseRegular)
                    .foregroundColor(.foregroundMuted)
                    .allowsHitTesting(false)
            }

            TextField("", text: $text)
                .textStyle(.textBaseRegular)
                .foregroundColor(.foregroundDefault)
        }
        .padding(.horizontal, .sm)
        .padding(.vertical, .xs)
        .backgroundColor(.backgroundInput)
        .overlay(inputBorder)
        .cornerRadius(.md).disabledMask()
    }

    private var inputBorder: some View {
        RoundedRectangle(cornerRadius: .md)
            .stroke(.borderDefault, lineWidth: 1)
    }
}
