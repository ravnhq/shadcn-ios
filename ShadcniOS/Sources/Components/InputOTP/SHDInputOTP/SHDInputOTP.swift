//
//  SHDInputOTP.swift
//  ShadcniOS
//
//  Created by JoseAlvarez on 12/9/25.
//

import SwiftUI

/// A SwiftUI component for entering One-Time Password (OTP) codes.
///
/// ## Overview
///
/// `SHDInputOTP` provides a multi-field input component designed for entering OTP codes
/// commonly used in two-factor authentication (2FA) and verification flows. The component
/// automatically manages focus between fields, handles paste operations, validates input,
/// and provides visual feedback for errors.
///
/// ## Features
///
/// - **Automatic focus management**: Automatically moves focus to the next field when a digit is entered
/// - **Paste support**: Supports pasting complete OTP codes that match the expected length
/// - **Custom validation**: Allows custom validation logic with error message display
/// - **Visual states**: Supports error states and separator styling
/// - **Configurable sizing**: Multiple size options (small, medium, large)
/// - **Flexible length**: Supports 4, 6, or 8 digit codes
///
/// ## Initialization
///
/// - `code`: A binding to the string that will contain the entered OTP code
/// - `caption`: Optional caption text displayed below the input fields
/// - `validateError`: Optional closure that validates the code and returns an error message if invalid
///
/// ## Modifiers
///
/// - `.inputOTPConfiguration(size:length:)`: Configures the size and length of the OTP input
/// - `.isPattern(_:)`: Enables pattern mode (currently reserved for future use)
/// - `.isError(_:)`: Manually sets the error visual state
/// - `.otpSeparatorStyle(_:)`: Enables or disables visual separators between digit groups
///
/// ## Usage
///
/// ```swift
/// @State private var otpCode: String = ""
///
/// SHDInputOTP(code: $otpCode, caption: "Enter verification code")
///     .inputOTPConfiguration(size: .md, length: .standard)
///     .isError(false)
/// ```
///
/// With custom validation:
///
/// ```swift
/// SHDInputOTP(
///     code: $otpCode,
///     caption: "Enter 6-digit code",
///     validateError: { code in
///         code.count == 6 ? nil : "Code must be 6 digits"
///     }
/// )
/// .inputOTPConfiguration(length: .standard)
/// ```
public struct SHDInputOTP: View {
    @Binding var code: String
    @FocusState private var focusedField: Int?
    @State private var viewModel = SHDInputOTPViewModel()
    @State private var validationErrorMessage: String?

    private var caption: String = ""
    private var isPattern: Bool = false
    private var size: SHDInputOTPSizing = .md
    private var length: SHDInputOTPLength = .standard
    private var isError: Bool = false
    private var isSeparated: Bool = false
    private let validateError: (String) -> String?

    private var resolvedIsError: Bool {
        isError || validationErrorMessage != nil
    }

    private var resolvedCaption: String {
        validationErrorMessage ?? caption
    }

    /// Creates a new OTP input component.
    ///
    /// - Parameters:
    ///   - code: A binding to the string that will store the entered OTP code.
    ///   - caption: Optional caption text displayed below the input fields. Defaults to an empty string.
    ///   - validateError: A closure that validates the entered code and returns an error message
    ///     if validation fails, or `nil` if the code is valid. Defaults to a closure that always returns `nil`.
    public init(
        code: Binding<String>,
        caption: String = "",
        validateError: @escaping (String) -> String? = { _ in nil }
    ) {
        self._code = code
        self.caption = caption
        self.validateError = validateError
    }

    public var body: some View {
        @Bindable var vm = viewModel

        VStack(spacing: .sm) {
            HStack(spacing: SHDSizing.Spacing.none.value) {
                ForEach(vm.otpDigits.indices, id: \.self) { index in

                    let state = viewModel.bordersState(
                        at: index,
                        length: length,
                        isSeparated: isSeparated
                    )

                    SHDInputOTPItem(
                        text: $vm.otpDigits[index],
                        state: state
                    )
                    .itemSize(size)
                    .onBackspace {
                        if index > 0 {
                            focusedField = index - 1
                        }
                    }
                    .onPaste({ pastedContent in
                        onPasteLogic(pastedContent: pastedContent, vm: vm)
                    })
                    .focused($focusedField, equals: index)
                    .onChange(of: viewModel.otpDigits[index]) { _, newValue in
                        if let nextFocus = viewModel.handleInputChange(
                            newValue,
                            at: index
                        ) {
                            focusedField = nextFocus
                        }
                    }

                    if state.showSeparator && isSeparated {
                        Circle()
                            .fill(SHDColor.iconDefault.color)
                            .frame(width: 4, height: 4)
                            .padding(.horizontal, 8)
                    }
                }
                .isInputOTPError(resolvedIsError)
            }

            Text(resolvedCaption)
                .textStyle(size.textStyle)
        }
        .onAppear {
            viewModel.setup(for: length)
        }
        .onChange(of: length) { _, newLength in
            viewModel.otpDigits.removeAll()
            viewModel.setup(for: newLength)
            validationErrorMessage = nil
        }
        .onChange(of: viewModel.otpDigits) { _, _ in
            let current = viewModel.currentCode
            code = current
            validationErrorMessage = validateError(current)
        }
        .onChange(of: focusedField) { _, newFocus in
            if let correctedFocus = viewModel.validateFocus(
                targetIndex: newFocus
            ) {
                focusedField = correctedFocus
            }
        }
    }

    private func onPasteLogic(pastedContent: String, vm: SHDInputOTPViewModel) {
        let cleanContent = pastedContent.filter { !$0.isWhitespace }
        if cleanContent.count == vm.otpDigits.count {
            DispatchQueue.main.async {
                for (offset, character) in cleanContent.enumerated() where offset < vm.otpDigits.count {
                    vm.otpDigits[offset] = String(character)
                }
                self.validationErrorMessage = nil
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.05) {
                    self.focusedField = nil
                }
            }
        }
    }

    /// Configures the size and length of the OTP input component.
    ///
    /// - Parameters:
    ///   - size: The visual size of individual input fields. Defaults to `.md`.
    ///   - length: The number of digits in the OTP code. Defaults to `.standard` (6 digits).
    /// - Returns: A modified `SHDInputOTP` with the specified configuration.
    public func inputOTPConfiguration(
        size: SHDInputOTPSizing = .md,
        length: SHDInputOTPLength = .standard
    ) -> Self {
        return mutating { inputOTP in
            inputOTP.size = size
            inputOTP.length = length
        }
    }

    /// Enables or disables pattern mode for the OTP input.
    ///
    /// - Parameter isPattern: Whether to enable pattern mode. Defaults to `true`.
    /// - Returns: A modified `SHDInputOTP` with pattern mode enabled or disabled.
    ///
    /// - Note: Pattern mode is currently reserved for future functionality.
    public func isPattern(_ isPattern: Bool = true) -> Self {
        mutating(keyPath: \.isPattern, value: isPattern)
    }

    /// Sets the error visual state of the OTP input component.
    ///
    /// - Parameter isError: Whether to display the error state. Defaults to `true`.
    /// - Returns: A modified `SHDInputOTP` with the error state applied.
    ///
    /// - Note: The error state can also be set automatically through the `validateError` closure.
    public func isError(_ isError: Bool = true) -> Self {
        mutating(keyPath: \.isError, value: isError)
    }

    /// Enables or disables visual separators between digit groups.
    ///
    /// - Parameter isSeparaed: Whether to show separators between digit groups. Defaults to `true`.
    /// - Returns: A modified `SHDInputOTP` with separator styling applied.
    ///
    /// - Note: Separators are displayed between groups based on the OTP length configuration.
    public func otpSeparatorStyle(_ isSeparaed: Bool = true) -> Self {
        mutating(keyPath: \.isSeparated, value: isSeparaed)
    }
}

#Preview {
    SHDInputOTPPreview()
}
