//
//  SHDSecureField.swift
//  ShadcniOS
//
//  Created by Concepción Orellana on 12/15/25.
//

import SwiftUI

/// A password-friendly text input with built-in secure entry and visibility toggle.
///
/// ## Discussion
/// `SHDSecureField` mirrors the layout and styling of `SHDTextField` but always treats
/// its content as sensitive. Users can toggle visibility with an eye/eye-off control
/// while error handling and sizing stay consistent with the text input component.
///
/// - Parameters:
///   - placeholder: Optional placeholder shown when the field is empty.
///   - leadingIcon: Optional icon displayed before the text.
///   - text: Bound value for the input content.
///
/// ## Usage
/// ```swift
/// @State private var password = ""
/// SHDSecureField(placeholder: "Password", text: $password)
///     .inputStyle(.md)
/// ```
public struct SHDSecureField: View {
    @Environment(\.inlineError) private var inlineError

    @FocusState private var isFocused: Bool
    @State private var isSecureEntryRevealed: Bool = false

    @Binding private var text: String

    private let placeholder: String?
    private let leadingIcon: SHDIconAsset?
    private var size: SHDInputSize = .md

    private var textColor: Color {
        inlineError != nil ? .foregroundDestructiveDefault : .foregroundDefault
    }

    private var secureFieldIcon: SHDIconAsset {
        isSecureEntryRevealed ? .eye : .eyeOff
    }

    public init(
        placeholder: String? = nil,
        leadingIcon: SHDIconAsset? = nil,
        text: Binding<String>
    ) {
        self.placeholder = placeholder
        self.leadingIcon = leadingIcon
        _text = text
    }

    public var body: some View {
        HStack(spacing: .sm) {
            if let leadingIcon {
                iconView(leadingIcon)
            }

            ZStack(alignment: .leading) {
                if text.isEmpty, let placeholder {
                    Text(placeholder)
                        .textStyle(size.textStyle)
                        .foregroundColor(.foregroundMuted)
                        .allowsHitTesting(false)
                }

                if isSecureEntryRevealed {
                    TextField("", text: $text)
                        .textStyle(size.textStyle)
                        .foregroundColor(textColor)
                        .focused($isFocused)
                } else {
                    SecureField("", text: $text)
                        .textStyle(size.textStyle)
                        .foregroundColor(textColor)
                        .focused($isFocused)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)

            Button {
                isSecureEntryRevealed.toggle()
            } label: {
                iconView(secureFieldIcon)
            }
            .buttonStyle(.plain)
        }
        .padding(.horizontal, .xs)
        .padding(.vertical, size.paddingStyle)
        .backgroundColor(.backgroundDefault)
        .inputBorder(isFocused: isFocused)
        .disabledMask()
    }

    /// Applies the input size, updating text style, icon size, and height tokens.
    ///
    /// Available sizes: `.sm`, `.md`, `.lg`.
    ///
    /// - Parameter size: Desired input size. Defaults to `.md`.
    /// - Returns: A secure input configured with the given size.
    public func inputStyle(_ size: SHDInputSize = .md) -> some View {
        mutating(keyPath: \.size, value: size)
    }

    private func iconView(_ icon: SHDIconAsset) -> some View {
        SHDIcon(icon)
            .iconSize(size.iconSize)
            .foregroundColor(.iconDefault)
    }
}

#Preview {
    SHDInputPreview()
}

