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
    private let leadingIcon: SHDIconAsset?
    private let trailingIcon: SHDIconAsset?

    /// Creates a ShadcniOS text input.
    ///
    /// - Parameters:
    ///   - text: Bound text value for the field.
    ///   - placeholder: Placeholder text displayed when the input is empty.
    ///   - leadingIcon: Optional icon displayed at the leading edge of the field.
    ///   - trailingIcon: Optional icon displayed at the trailing edge of the field.
    public init(
        text: Binding<String>,
        placeholder: String,
        leadingIcon: SHDIconAsset? = nil,
        trailingIcon: SHDIconAsset? = nil
    ) {
        _text = text
        self.placeholder = placeholder
        self.leadingIcon = leadingIcon
        self.trailingIcon = trailingIcon
    }

    public var body: some View {
        HStack(spacing: .sm) {
            if let leadingIcon {
                iconView(leadingIcon)
            }

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
            .frame(maxWidth: .infinity, alignment: .leading)

            if let trailingIcon {
                iconView(trailingIcon)
            }
        }
        .padding(.horizontal, .xs)
        .padding(.vertical, .xs)
        .backgroundColor(.backgroundDefault)
        .overlay(inputBorder)
        .cornerRadius(.md)
        .disabledMask()
    }

    private var inputBorder: some View {
        RoundedRectangle(cornerRadius: .md)
            .stroke(.borderDefault, lineWidth: 1)
    }

    private func iconView(_ icon: SHDIconAsset) -> some View {
        SHDIcon(icon)
            .iconSize(.lg)
            .foregroundColor(.iconDefault)
    }
}
