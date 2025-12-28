//
//  SHDTextInput.swift
//  ShadcniOS
//
//  Created by Concepción Orellana on 12/15/25.
//

import SwiftUI

/// A foundational textfield used throughout the ShadcniOS design system.
///
/// ## Discussion
/// `SHDTextField` binds to external text, renders a placeholder when empty, and
/// supports optional leading/trailing icons. Size and typography are driven by
/// the `inputStyle` modifier, following design tokens for height, padding, and type.
///
/// The component supports several states:
/// - **Focus state**: Shows a primary border when focused.
/// - **Error state**: Shows destructive border and text color via `shdInlineError`.
///   The error state clears automatically when the user starts typing.
/// - **Secure field**: Converts to a password field with visibility toggle via `shdSecureField`.
///   When enabled, an eye icon replaces the trailing icon to toggle password visibility.
///
/// - Parameters:
///   - placeholder: Placeholder text displayed when the input is empty.
///   - leadingIcon: Optional icon displayed at the leading edge of the field.
///   - trailingIcon: Optional icon displayed at the trailing edge of the field.
///     Note: This is ignored when `shdSecureField` is enabled.
///   - text: Bound text value for the field.
///
/// ## Usage
/// Basic text field:
/// ```swift
/// @State private var email = ""
/// SHDTextField(placeholder: "Email address", text: $email)
///     .inputStyle(.md)
/// ```
///
/// With inline error:
/// ```swift
/// @State private var email = ""
/// SHDTextField(placeholder: "Email address", text: $email)
///     .inputStyle(.md)
///     .shdInlineError("Please enter a valid email address")
/// ```
///
/// Secure password field:
/// ```swift
/// @State private var password = ""
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
