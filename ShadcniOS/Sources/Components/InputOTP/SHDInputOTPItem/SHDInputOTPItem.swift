//
//  SHDInputOTPItem.swift
//  ShadcniOS
//
//  Created by JoseAlvarez on 12/9/25.
//

import SwiftUI
import UIKit

/// A single input field used by `SHDInputOTP` to render and manage one character in an OTP code.
///
/// ## Overview
///
/// `SHDInputOTPItem` is an internal view representing a single text field for one character
/// of a One-Time Password. It handles visual state, error indication, and sizing. Focus and
/// value propagation are managed by the parent `SHDInputOTP`; this component itself manages
/// the text input and backspace handling.
///
/// - The component manages the text binding and applies visual styling
///     including size, error state, and border.
/// - Sizing can be set with `.itemSize(_:)`.
/// - Error state is inherited from the parent via environment values.
/// - Backspace handling can be set with `.onBackspace(_:)`.
/// - Paste handling can be set with `.onPaste(_:)`.
///
/// ## Initialization
///
/// - `text`: A two-way `Binding<String>` for this slot's text value (should be a single character).
/// - `state`: The border style configuration that determines which corners are rounded
///     and whether a separator should be shown.
///
/// ## Modifiers
///
/// - `.itemSize(_:)`: Sets the visual size of the input field.
/// - `.onBackspace(_:)`: Sets the action to perform when backspace is pressed on an empty field.
/// - `.onPaste(_:)`: Sets the action to perform when content is pasted into the field.
///
/// ## Usage
///
/// This component is intended for internal use by `SHDInputOTP`. Typical usage (internal to the parent):
///
/// ```swift
/// SHDInputOTPItem(
///   text: $otpDigits[0],
///   state: SHDInputOTPItemBorderStyle(
///     isStart: true,
///     isEnd: false,
///     showSeparator: false
///   )
/// )
/// .itemSize(.md)
/// .onBackspace {
///     // Handle backspace
/// }
/// .onPaste { pastedContent in
///     // Handle paste
/// }
/// ```
///
/// - Properties: None exposed beyond those passed in the initializer.
/// - Modifiers:
///     - `itemSize(_:)`: Set the size.
///     - `onBackspace(_:)`: Set the backspace action.
///     - `onPaste(_:)`: Set the paste action.
/// - Focus and grouping are managed by the parent `SHDInputOTP`.
internal struct SHDInputOTPItem: View {

    private let onValueChange: (String) -> Void = { _ in }
    private var onPaste: (String) -> Void = { _ in }
    private let zws = "\u{200B}"
    private var onBackspace: () -> Void = {}
    private var size: SHDInputOTPSizing = .md
    private var state: SHDInputOTPItemBorderStyle

    @Environment(\.isInputOTPError) private var isError

    @Binding private var text: String

    /// Creates a new OTP input item.
    ///
    /// - Parameters:
    ///   - text: A binding to the string value for this input field (typically a single character).
    ///   - state: The border style configuration that determines visual appearance and separator display.
    init(
        text: Binding<String>,
        state: SHDInputOTPItemBorderStyle
    ) {
        _text = text
        self.state = state
    }

    var body: some View {
        TextField(
            "",
            text: Binding(
                get: {
                    text.isEmpty ? zws : text
                },
                set: { newValue in
                    if newValue.isEmpty {
                        text = ""
                        onBackspace()
                        return
                    }

                    let cleanValue =
                        newValue
                        .replacingOccurrences(of: zws, with: "")
                        .filter { !$0.isWhitespace }

                    if cleanValue != text {
                        onPaste(cleanValue)
                        text = cleanValue
                    } else {
                        let inputHadInvalidChars = newValue.contains {
                            $0.isWhitespace
                        }

                        if inputHadInvalidChars {
                            DispatchQueue.main.async {
                                let current = text
                                text = current
                            }
                        }
                    }
                }
            )
        )
        .textContentType(.oneTimeCode)
        .autocorrectionDisabled()
        .contentShape(Rectangle())
        .lineLimit(1)
        .multilineTextAlignment(.center)
        .frame(width: size.textFieldSize, height: size.textFieldSize)
        .tint(.borderPrimaryDefault)
        .otpBorder(
            state: state,
            isError: isError
        )
        .onChange(of: text) { newValue in
            if newValue == zws { return }
            onValueChange(newValue)
        }
    }

    /// Sets the visual size of the input field.
    ///
    /// - Parameter size: The size configuration for the input field. Defaults to `.md`.
    /// - Returns: A modified `SHDInputOTPItem` with the specified size.
    func itemSize(_ size: SHDInputOTPSizing = .md) -> Self {
        mutating(keyPath: \.size, value: size)
    }

    /// Sets the action to perform when backspace is pressed on an empty field.
    ///
    /// - Parameter action: A closure that is called when backspace is pressed on an empty field.
    /// - Returns: A modified `SHDInputOTPItem` with the backspace handler configured.
    public func onBackspace(_ action: @escaping () -> Void) -> Self {
        mutating(keyPath: \.onBackspace, value: action)
    }

    /// Sets the action to perform when content is pasted into the field.
    ///
    /// - Parameter action: A closure that receives the pasted content string.
    /// - Returns: A modified `SHDInputOTPItem` with the paste handler configured.
    public func onPaste(_ action: @escaping (String) -> Void) -> Self {
        mutating(keyPath: \.onPaste, value: action)
    }
}

#Preview {
    @Previewable @State var text: String = "1"
    
    VStack(spacing: 20) {

        SHDInputOTPItem(
            text: $text,
            state: SHDInputOTPItemBorderStyle(
                isStart: true, isEnd: true, showSeparator: false
            )
        )

        SHDInputOTPItem(
            text: $text,
            state: SHDInputOTPItemBorderStyle(
                isStart: true, isEnd: true, showSeparator: false
            )
        )
        .environment(\.isInputOTPError, true)
    }
}
