//
//  SHDTextInput.swift
//  ShadcniOS
//
//  Created by Concepción Orellana on 12/15/25.
//

import SwiftUI

/// A design-system text input that supports icons, sizing, inline error, and secure entry.
///
/// ## Discussion
/// `SHDTextField` binds to external text, renders a placeholder when empty, and
/// supports optional leading/trailing icons. Sizing, padding, and typography are
/// driven by the `inputStyle` modifier.
///
/// State handling:
/// - **Focus**: Shows the primary focus border while active.
/// - **Error**: Use `shdInlineError` to surface destructive border/text and a helper message.
/// - **Secure**: Use `shdSecureField(true)` to render a secure field with an eye/eye-off toggle.
///   When secure mode is enabled, the trailing icon is replaced by the visibility toggle.
///
/// - Parameters:
///   - placeholder: Optional placeholder shown when the field is empty.
///   - leadingIcon: Optional icon displayed before the text.
///   - trailingIcon: Optional icon displayed after the text (ignored when secure mode is on).
///   - text: Bound value for the input content.
///
/// ## Usage
/// Basic:
/// ```swift
/// @State private var email = ""
/// SHDTextField(placeholder: "Email address", text: $email)
///     .inputStyle(.md)
/// ```
///
/// Inline error:
/// ```swift
/// SHDTextField(placeholder: "Email address", text: $email)
///     .inputStyle(.md)
///     .shdInlineError("Please enter a valid email address")
/// ```
///
/// Secure:
/// ```swift
/// SHDTextField(placeholder: "Password", text: $password)
///     .inputStyle(.md)
///     .shdSecureField(true)
/// ```
public struct SHDTextField: View {
    @Environment(\.inlineError) private var inlineError
    @Environment(\.isSecureField) private var isSecureField

    @FocusState private var isFocused: Bool
    @State private var isPasswordVisible: Bool = false

    @Binding private var text: String

    private let placeholder: String?
    private let leadingIcon: SHDIconAsset?
    private let trailingIcon: SHDIconAsset?
    private var size: SHDInputSize = .md

    private var textColor: Color {
        inlineError != nil ? .foregroundDestructiveDefault : .foregroundDefault
    }

    private var secureFieldIcon: SHDIconAsset {
        isPasswordVisible ? .eye : .eyeOff
    }

    public init(
        placeholder: String? = nil,
        leadingIcon: SHDIconAsset? = nil,
        trailingIcon: SHDIconAsset? = nil,
        text: Binding<String>
    ) {
        self.placeholder = placeholder
        self.leadingIcon = leadingIcon
        self.trailingIcon = trailingIcon
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

                if isSecureField && !isPasswordVisible {
                    SecureField("", text: $text)
                        .textStyle(size.textStyle)
                        .foregroundColor(textColor)
                        .focused($isFocused)
                } else {
                    TextField("", text: $text)
                        .textStyle(size.textStyle)
                        .foregroundColor(textColor)
                        .focused($isFocused)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)

            if isSecureField {
                Button {
                    isPasswordVisible.toggle()
                } label: {
                    iconView(secureFieldIcon)
                }
                .buttonStyle(.plain)
            } else if let trailingIcon {
                iconView(trailingIcon)
            }
        }
        .padding(.horizontal, .xs)
        .padding(.vertical, size.paddingStyle)
        .backgroundColor(.backgroundDefault)
        .inputBorder(isFocused: isFocused, hasError: inlineError != nil)
        .disabledMask()
    }

    /// Applies the input size, updating text style, icon size, and height tokens.
    ///
    /// Available sizes: `.sm`, `.md`, `.lg`.
    ///
    /// - Parameter size: Desired input size. Defaults to `.md`.
    /// - Returns: A text input configured with the given size.
    public func inputStyle(_ size: SHDInputSize = .md) -> some View {
        mutating(keyPath: \.size, value: size)
    }

    private func iconView(_ icon: SHDIconAsset) -> some View {
        SHDIcon(icon)
            .iconSize(size.iconSize)
            .foregroundColor(.iconDefault)
    }
}
