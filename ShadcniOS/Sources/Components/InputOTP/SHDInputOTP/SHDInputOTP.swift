//
//  SHDInputOTP.swift
//  ShadcniOS
//
//  Created by JoseAlvarez on 12/9/25.
//

import SwiftUI

/// A customizable one-time password (OTP) input component for authentication flows.
///
/// ## Description
///
/// `SHDInputOTP` provides a user-friendly interface for entering numeric or alphanumeric
/// verification codes. The component displays a series of individual input slots, automatically
/// managing keyboard focus transitions as users type. It supports multiple visual layouts
/// (controlled, pattern, and separator variants) with customizable sizes and lengths to
/// accommodate different OTP formats (4, 6, or 8 digits).
///
/// ## Discussion
///
/// The component utilizes SwiftUI's `@State` and `@FocusState` property wrappers to manage
/// the digit array and keyboard focus respectively. This architecture ensures responsive
/// focus management, allowing users to navigate fields intuitively using automatic
/// progression when typing and regression when deleting.
///
/// Key implementation details:
/// - `Auto-advance`: When a digit is entered, focus automatically moves to the next field.
/// - `Auto-regress`: When the last digit is deleted, focus moves back to the previous field.
/// - `Single-character enforcement`: Each field accepts only one character, with excess input trimmed.
/// - `State preservation`: When the OTP length changes, the component resets fields
///     and refocuses the first input.
/// - `Dynamic layout`: Visual appearance adapts based on variant, size, and length configurations.
/// - `Error feedback`: Visual error styling can be applied for failed validation attempts.
///
/// The component separates rendering concerns by delegating individual slot rendering to
/// `SHDInputOTPItem` and separator rendering to `SHDInputOTPSeparator`. Captions are shown
/// only in the `.controlled` variant.
///
/// `SHDInputOTP` exposes a two-way `code` binding (see initializer) which is kept in sync
/// with the composed OTP value as the user types. Consumers can bind a `@State` or
/// `@Binding` to `code` to observe the full OTP string and implement completion handling,
/// validation, or submission logic in their parent view.
///
/// ## Parameters → Init
///
/// - `caption`: An optional descriptive text displayed below the input fields when using the `.controlled`
///   variant. Use this to provide instructions or context about the OTP. Default is an empty string.
/// - `code`: A `Binding<String>` that receives the concatenated OTP value as the user enters
///   characters. Bind a `@State` or `@Binding` value from the parent to observe changes and
///   react to completion or validation events.
///
/// ## Variables → Public variables
///
/// - `code` (via initializer): A two-way binding that contains the full composed OTP string.
///   All other visual and behavioral options are configured through modifier methods.
///
/// ## Functions → Public functions
///
/// - `inputOTPConfiguration(variant:size:length:)`: Configures the visual style, size
///      and length of the OTP input.
/// - `isError(_:)`: Sets the error state for visual feedback.
///
///
/// Creates a new OTP input component with an optional caption.
///
/// - Parameter caption: An optional caption text displayed below the input fields when using
///   the controlled variant. Default is an empty string.
///
/// ## Usage
///
/// ```swift
/// // Basic OTP input
/// SHDInputOTP()
///
/// // OTP input with caption
/// SHDInputOTP(caption: "Enter the 6-digit code sent to your email")
///     .inputOTPConfiguration(variant: .controlled, size: .md, length: .otp6)
///
/// // Separator variant for longer codes
/// SHDInputOTP(caption: "Verification code")
///     .inputOTPConfiguration(variant: .separator(groupOf: 3), size: .lg, length: .otp8)
///
/// // Pattern variant with error state
/// SHDInputOTP()
///     .inputOTPConfiguration(variant: .pattern, size: .sm, length: .otp4)
///     .isError(true)
/// ```

public struct SHDInputOTP: View {
    @State private var otpDigits: [String] = []
    @Binding private var code: String
    @FocusState private var focusedField: Int?

    private var caption: String = ""
    private var variant: SHDInputOTPVariant = .controlled
    private var size: SHDInputOTPSizing = .md
    private var isError: Bool = false
    private var length: SHDInputOTPLength = .otp6
    private var isFull: Bool {
        !isError && otpDigits.allSatisfy { !$0.isEmpty }
    }

    private var firstEmptyIndex: Int {
        otpDigits.firstIndex(where: { $0.isEmpty }) ?? (otpDigits.count - 1)
    }

    public init(caption: String = "", code: Binding<String>) {
        self.caption = caption
        self._code = code
    }

    public var body: some View {
        VStack(spacing: .sm) {
            HStack(spacing: SHDSizing.Spacing.none.value) {
                otpFields
            }

            if variant == .controlled && !caption.isEmpty {
                Text(caption)
                    .textStyle(size.textStyle)
                    .multilineTextAlignment(.center)
                    .padding(.top, .xxxs)
            }
        }
        .padding(.horizontal, .sm)
        .onAppear {
            otpDigits = Array(repeating: "", count: length.digits)
        }
        .onChange(of: focusedField) { newValue in
            guard let newValue = newValue else { return }

            if newValue > firstEmptyIndex {
                focusedField = firstEmptyIndex
            }
        }.onChange(of: length) { newLength in
            otpDigits = Array(repeating: "", count: newLength.digits)
            focusedField = 0
        }
        .onChange(of: otpDigits) { newValue in
            code = newValue.joined()
        }
    }

    @ViewBuilder
    private var otpFields: some View {
        ForEach(otpDigits.indices, id: \.self) { index in
            if variant.shouldShowSeparator(at: index, length: length) {
                SHDInputOTPSeparator()
            }

            let isFirst = index == 0
            let isLast = index == otpDigits.count - 1
            let isStart = variant.isStartOfGroup(index: index, length: length)
            let isEnd = variant.isEndOfGroup(index: index,
                                             totalCount: otpDigits.count,
                                             length: length)
            let showSeparator = variant.shouldShowSeparator(at: index, length: length)

            SHDInputOTPItem(
                text: $otpDigits[index],
                onValueChange: { newValue in
                    handleLogicChange(newValue, at: index)
                },
                isFull: isFull,
                isFirst: isFirst,
                isLast: isLast,
                showLeftSeparator: showSeparator,
                isStartOfGroup: isStart,
                isEndOfGroup: isEnd
            )
            .inputOTPItemConfiguration(variant: variant, size: size, length: length)
            .isError(isError)
            .focused($focusedField, equals: index)

        }
    }

    /// Handles logic when a slot's text value changes.
    ///
    /// This function enforces single-character input per slot (trimming excess input) and
    /// advances or regresses keyboard focus appropriately.
    ///
    /// ## Behavior
    /// - Trims any input longer than one character to the first character.
    /// - When a single character is entered and this is not the last slot, focus advances to the next slot.
    /// - When the slot is cleared and this is not the first slot, focus moves back to the previous slot.
    /// - Parameters:
    ///   - value: The new text value for the slot. May contain more than one character (e.g., paste).
    ///   - index: The zero-based index of the slot that changed.
    private func handleLogicChange(_ value: String, at index: Int) {
        if value.count > 1 {
            otpDigits[index] = String(value.prefix(1))
        }

        if value.count == 1, index < otpDigits.count - 1 {
            focusedField = index + 1
        } else if value.isEmpty, index > 0 {
            focusedField = index - 1
        }
    }

    /// Configures the visual variant, size, and length of the OTP input component.
    ///
    /// This modifier allows you to customize how the OTP input is displayed and how many digits it accepts.
    /// The variant determines the layout style, the size affects field dimensions and text styling, and the
    /// length specifies the number of input digits.
    ///
    /// - Parameters:
    ///   - variant: The visual layout variant controlling appearance and caption display:
    ///     - `.controlled` (default): Displays caption text below the input fields
    ///     - `.pattern`: Clean minimal layout without separators or captions
    ///     - `.separator(groupOf:)`: Groups fields with visual separators at specified intervals
    ///   - size: The size of each input field (default: `.md`):
    ///     - `.sm`: 40pt fields with small text style
    ///     - `.md`: 44pt fields with base text style
    ///     - `.lg`: 48pt fields with large text style
    ///   - length: The number of input digits (default: `.otp6`):
    ///     - `.otp4`: 4-digit OTP
    ///     - `.otp6`: 6-digit OTP (standard)
    ///     - `.otp8`: 8-digit OTP
    ///
    /// - Returns: A configured instance of `SHDInputOTP`.
    ///
    /// - Note: Changing the length resets all input fields and refocuses the first field.
    public func inputOTPConfiguration(
        variant: SHDInputOTPVariant = .controlled,
        size: SHDInputOTPSizing = .md,
        length: SHDInputOTPLength = .otp6
    ) -> Self {
        let (validatedVariant, warning) = variant.validations(
            for: length,
            size: size
        )
        if let warning {
            print("⚠️ [SHDInputOTP]: \(warning)")
        }
        return mutating { inputOTP in
            inputOTP.variant = validatedVariant
            inputOTP.size = size
            inputOTP.length = length
        }
    }

    /// Sets the error state for visual feedback on the OTP input.
    ///
    /// When enabled, all input fields display error styling (red border) to indicate validation failure
    /// or incorrect input. This provides immediate visual feedback to users about input validation issues.
    ///
    /// - Parameter isError: A Boolean value indicating whether the input should display error styling.
    ///   Default is `true`.
    ///
    /// - Returns: A configured instance of `SHDInputOTP` with the error state applied.
    ///
    /// ## Example
    /// ```swift
    /// @State private var hasError = false
    ///
    /// SHDInputOTP(caption: "Enter verification code")
    ///     .inputOTPConfiguration(variant: .controlled, length: .otp6)
    ///     .isError(hasError)
    /// ```
    public func isError(_ isError: Bool = true) -> Self {
        mutating(keyPath: \.isError, value: isError)
    }
}

#Preview {
    SHDInputOTPPreview()
}
