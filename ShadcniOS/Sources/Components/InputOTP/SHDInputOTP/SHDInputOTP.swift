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
///     .inputOTPConfiguration(variant: .controlled, size: .md, length: .standard)
///
/// // Separator variant for longer codes
/// SHDInputOTP(caption: "Verification code")
///     .inputOTPConfiguration(variant: .controlled, size: .lg, length: .extended)
///
/// // Pattern variant with error state
/// SHDInputOTP()
///     .inputOTPConfiguration(variant: .pattern, size: .sm, length: .short)
///     .isError(true)
/// ```

public struct SHDInputOTP: View {
    @State private var viewModel = SHDInputOTPViewModel()
    @Binding private var code: String
    @FocusState private var focusedField: Int?

    private var caption: String = ""
    private var variant: SHDInputOTPVariant = .controlled
    private var size: SHDInputOTPSizing = .md
    private var isError: Bool = false
    private var length: SHDInputOTPLength = .standard

    public init(code: Binding<String>, caption: String = "") {
        self._code = code
        self.caption = caption
    }

    public var body: some View {
        @Bindable var vm = viewModel

        VStack(spacing: .sm) {
            HStack(spacing: SHDSizing.Spacing.none.value) {
                ForEach(vm.otpDigits.indices, id: \.self) { index in
                    if viewModel.shouldShowSeparator(at: index, variant: variant, length: length) {
                        SHDInputOTPSeparator()
                    }

                    let style = viewModel.slotStyle(
                        at: index,
                        totalCount: viewModel.otpDigits.count,
                        variant: variant,
                        length: length
                    )

                    SHDInputOTPItem(
                        position: style.position,
                        text: $vm.otpDigits[index]
                    )
                    .itemSize(size)
                    .isError(isError)
                    .onBackspace {
                        if index > 0 {
                            focusedField = index - 1
                        }
                    }
                    .focused($focusedField, equals: index)
                    .onChange(of: viewModel.otpDigits[index]) { _, newValue in
                        if let nextFocus = viewModel.handleInputChange(
                            newValue,
                            at: index
                        ) {
                            focusedField = nextFocus
                        }
                    }
                }
            }

            if variant == .controlled {
                Text(caption)
                    .textStyle(size.textStyle)
            }
        }
        .onAppear {
            viewModel.setup(length: length.digits)
        }
        .onChange(of: length) { _, newLength in
            viewModel.otpDigits.removeAll()
            viewModel.setup(length: newLength.digits)
        }
        .onChange(of: viewModel.otpDigits) { _, _ in
            code = viewModel.currentCode
        }
        .onChange(of: focusedField) { _, newFocus in
            if let correctedFocus = viewModel.validateFocus(
                targetIndex: newFocus
            ) {
                focusedField = correctedFocus
            }
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
    ///   - length: The number of input digits (default: `.standard`):
    ///     - `.short`: 4-digit OTP
    ///     - `.standard`: 6-digit OTP (standard)
    ///     - `.extended`: 8-digit OTP
    ///
    /// - Returns: A configured instance of `SHDInputOTP`.
    ///
    /// - Note: Changing the length resets all input fields and refocuses the first field.
    public func inputOTPConfiguration(
        variant: SHDInputOTPVariant = .controlled,
        size: SHDInputOTPSizing = .md,
        length: SHDInputOTPLength = .standard
    ) -> Self {
        let (validatedVariant, warning) =
            SHDInputOTPViewModel.validateConfiguration(
                variant: variant,
                length: length,
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
    ///     .inputOTPConfiguration(variant: .controlled, length: .standard)
    ///     .isError(hasError)
    /// ```
    public func isError(_ isError: Bool = true) -> Self {
        mutating(keyPath: \.isError, value: isError)
    }
}

#Preview {
    SHDInputOTPPreview()
}
