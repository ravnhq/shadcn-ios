//
//  SHDTextInput.swift
//  ShadcniOS
//
//  Created by Concepción Orellana on 12/15/25.
//

import SwiftUI

/// A design-system text input that supports icons, sizing, and inline error.
///
/// ## Discussion
/// `SHDTextField` binds to external text, renders a placeholder when empty, and
/// supports optional leading/trailing icons. Sizing, padding, and typography are
/// driven by the `inputStyle` modifier. For password-style inputs, use `SHDSecureField`
/// to get the visibility toggle and secure entry defaults.
///
/// State handling:
/// - **Focus**: Shows the primary focus border while active.
/// - **Error**: Use `inlineError` to surface destructive border/text and a helper message.
///
/// - Parameters:
///   - placeholder: Optional placeholder shown when the field is empty.
///   - leadingIcon: Optional icon displayed before the text.
///   - trailingIcon: Optional icon displayed after the text.
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
///     .inlineError("Please enter a valid email address")
/// ```
public struct SHDTextField: View {
    @Environment(\.inlineError) private var inlineError

    @FocusState private var isFocused: Bool

    @Binding private var text: String

    private let placeholder: String?
    private let leadingIcon: SHDIconAsset?
    private let trailingIcon: SHDIconAsset?
    private var size: SHDInputSize = .md

    private var textColor: Color {
        inlineError != nil ? .foregroundDestructiveDefault : .foregroundDefault
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

                TextField("", text: $text)
                    .textStyle(size.textStyle)
                    .foregroundColor(textColor)
                    .focused($isFocused)
            }
            .frame(maxWidth: .infinity, alignment: .leading)

            if let trailingIcon {
                iconView(trailingIcon)
            }
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

#Preview {
    SHDInputPreview()
}
