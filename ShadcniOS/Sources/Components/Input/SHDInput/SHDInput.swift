//
//  SwiftUIView.swift
//  ShadcniOS
//
//  Created by Diego Takaki on 12/8/25.
//

import SwiftUI

/// A flexible, composable text input field used throughout the ShadcniOS design system.
///
/// ## Discussion
/// `SHDInput` provides a text input component that supports:
/// - Label text displayed above the input field
/// - Optional leading icon for visual context (left side)
/// - Optional trailing icon for actions or indicators (right side)
/// - Placeholder text when the field is empty
/// - Optional caption text below the input
/// - Real-time validation with error display
/// - Focus state management with visual feedback
///
/// Visual styling (colors, borders, typography) is handled internally with
/// support for external customization through:
///
/// - `.inputVariant(variant:size:)`
/// - environment values
///
/// This component automatically manages focus state and provides visual
/// feedback through border highlighting when the field is active.
///
/// ## Validation
///
/// The input supports real-time validation through an optional validation closure:
///
/// - When a validation closure is provided and the text is **non-empty**,
///   validation runs automatically as the user types.
///
/// - If validation **fails** (`validation(text)` returns `false`):
///   - The border changes to **red**
///   - The caption is replaced with the **error text** in red
///
/// - If validation **succeeds** or the field is **empty**:
///   - Normal border colors apply (focused or unfocused)
///   - The standard caption appears in muted color
///
/// - The input remains interactive during validation states.
///
/// ## Layout Rules
///
/// - Label appears above the input field
/// - Leading icon (if provided) appears inside the field on the left
/// - Trailing icon (if provided) appears inside the field on the right
/// - Caption or error text appears below the field
/// - Border adapts based on focus and validation state
///
/// ## Usage
///
/// Basic text input:
/// ```swift
/// @State private var username = ""
///
/// SHDInput(
///     text: $username,
///     label: "Username",
///     placeholder: "Enter your username"
/// )
/// ```
///
/// With leading icon and caption:
/// ```swift
/// @State private var email = ""
///
/// SHDInput(
///     text: $email,
///     label: "Email",
///     leadingIcon: .envelope,
///     placeholder: "you@example.com",
///     caption: "We'll never share your email."
/// )
/// ```
///
/// With trailing icon (e.g., for password visibility toggle):
/// ```swift
/// @State private var password = ""
///
/// SHDInput(
///     text: $password,
///     label: "Password",
///     leadingIcon: .lock,
///     trailingIcon: .eye,
///     placeholder: "Enter password"
/// )
/// ```
///
/// With validation:
/// ```swift
/// @State private var password = ""
///
/// SHDInput(
///     text: $password,
///     label: "Password",
///     leadingIcon: .lock,
///     placeholder: "Enter password",
///     caption: "Must be at least 8 characters",
///     errorText: "Password is too short",
///     validation: { text in
///         text.count >= 8
///     }
/// )
/// ```
///
/// With custom variant and size:
/// ```swift
/// SHDInput(text: $text, label: "Label")
///     .inputVariant(variant: .default, size: .lg)
/// ```
public struct SHDInput: View {

    private var variant: SHDInputVariant = .default
    private var size: SHDInputSize = .md
    private var label: String
    private var leadingIcon: SHDIconAsset?
    private var trailingIcon: SHDIconAsset?
    private var placeholder: String?
    private var caption: String?
    private var errorText: String?
    @Binding var text: String
    @FocusState private var isFocused: Bool
    let validation: ((String) -> Bool)?

    /// Creates a ShadcniOS text input field.
    ///
    /// - Parameters:
    ///   - text: A binding to the text value being edited.
    ///   - label: Text displayed above the input field.
    ///   - leadingIcon: Optional icon displayed at the start of the input field (left side).
    ///   - trailingIcon: Optional icon displayed at the end of the input field (right side).
    ///   - placeholder: Optional placeholder text shown when the field is empty.
    ///   - caption: Optional helper text displayed below the input field.
    ///   - errorText: Text displayed in place of caption when validation fails.
    ///   - validation: Optional closure that validates the input text. Returns `true` if valid, `false` otherwise.
    public init(text: Binding<String>,
                label: String,
                leadingIcon: SHDIconAsset? = nil,
                trailingIcon: SHDIconAsset? = nil,
                placeholder: String? = nil,
                caption: String? = nil,
                errorText: String? = nil,
                validation: ((String) -> Bool)? = nil) {
        _text = text
        self.label = label
        self.leadingIcon = leadingIcon
        self.trailingIcon = trailingIcon
        self.placeholder = placeholder
        self.caption = caption
        self.errorText = errorText
        self.validation = validation
    }

    public var body: some View {
        VStack(alignment: .leading, spacing: .xs) {
            Text(label)
                .textStyle(size.textSize)
                .foregroundStyle(.foregroundDefault)

            HStack(spacing: .sm) {
                if let leadingIcon = leadingIcon {
                    SHDIcon(leadingIcon)
                }
                TextField(placeholder ?? "", text: $text)
                    .foregroundStyle(isInvalid ? .red : .foregroundDefault)
                    .padding(.vertical, .sm)
                    .focused($isFocused)

                Spacer()

                if let trailingIcon = trailingIcon {
                    SHDIcon(trailingIcon)
                }
            }
            .padding(.horizontal, .xs)
            .background(Color(.systemBackground))
            .overlay(
                RoundedRectangle(cornerRadius: 6)
                    .stroke(borderColor, lineWidth: 1)
            )
            .contentShape(Rectangle())
            .onTapGesture {
                isFocused = true
            }

            if let displayText = captionOrErrorText {
                Text(displayText)
                    .textStyle(size.textSize)
                    .foregroundStyle(isInvalid ? .red : .foregroundMuted)
            }
        }
    }

    // MARK: - Helper Properties

    /// Determines whether the current input text is invalid based on validation rules.
    ///
    /// Returns `true` when:
    /// - A validation closure is provided
    /// - The text is not empty
    /// - The validation closure returns `false`
    private var isInvalid: Bool {
        guard let validation = validation, !text.isEmpty else {
            return false
        }
        return !validation(text)
    }

    /// The color to use for the input field border.
    ///
    /// Returns:
    /// - Red when validation fails
    /// - `.borderDefault` when focused and valid
    /// - `.separator` when unfocused and valid
    private var borderColor: Color {
        if isInvalid {
            return .red
        }
        return isFocused ? .borderDefault : Color(.separator)
    }

    /// The text to display below the input field.
    ///
    /// Returns:
    /// - `errorText` when validation fails and error text is provided
    /// - `caption` otherwise
    private var captionOrErrorText: String? {
        if isInvalid, let errorText = errorText {
            return errorText
        }
        return caption
    }

    /// Applies unified ShadcniOS input variant and size styling.
    ///
    /// - Parameters:
    ///   - variant: The visual style configuration for the input.
    ///   - size: The typography and spacing size of the input.
    /// - Returns: A view styled according to the ShadcniOS design system.
    public func inputVariant(variant: SHDInputVariant, size: SHDInputSize) -> some View {
        mutating { button in
            button.variant = variant
            button.size = size
        }
    }
}

#Preview {
    SHDInputPreview()
}
