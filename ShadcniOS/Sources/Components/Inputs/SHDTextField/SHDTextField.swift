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
/// - Parameters:
///   - placeholder: Placeholder text displayed when the input is empty.
///   - leadingIcon: Optional icon displayed at the leading edge of the field.
///   - trailingIcon: Optional icon displayed at the trailing edge of the field.
///   - text: Bound text value for the field.
///
/// ## Usage
/// ```swift
/// @State private var value = ""
/// SHDTextField(text: $value, placeholder: "Email address")
///     .inputStyle(.md)
/// ```
public struct SHDTextField: View {
    @Binding private var text: String

    private let placeholder: String
    private let leadingIcon: SHDIconAsset?
    private let trailingIcon: SHDIconAsset?
    private var size: SHDInputSize = .md

    public init(
        placeholder: String,
        leadingIcon: SHDIconAsset? = nil,
        trailingIcon: SHDIconAsset? = nil,
        text: Binding<String>
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
                        .textStyle(size.textStyle)
                        .foregroundColor(.foregroundMuted)
                        .allowsHitTesting(false)
                }

                TextField("", text: $text)
                    .textStyle(size.textStyle)
                    .foregroundColor(.foregroundDefault)
            }
            .frame(maxWidth: .infinity, alignment: .leading)

            if let trailingIcon {
                iconView(trailingIcon)
            }
        }
        .padding(.horizontal, .xs)
        .padding(.vertical, size.paddingStyle)
        .backgroundColor(.backgroundDefault)
        .overlay(
            RoundedRectangle(cornerRadius: .md)
                .stroke(.borderDefault, lineWidth: 1)
        )
        .disabledMask()
    }

    /// Applies the input size, updating text style, icon size, and height tokens.
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
