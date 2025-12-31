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
/// - Error state can be set with `.isError(_:)`.
/// - Backspace handling can be set with `.onBackspace(_:)`.
///
/// ## Initialization
///
/// - `position`: The position of the slot within the group
///      (start, middle, end, single) to determine border rounding.
/// - `text`: A two-way `Binding<String>` for this slot's text value (should be a single character).
///
/// ## Modifiers
///
/// - `.itemSize(_:)`: Sets the visual size of the input field.
/// - `.isError(_:)`: Sets the error visual state of the input field.
/// - `.onBackspace(_:)`: Sets the action to perform when backspace is pressed on an empty field.
///
/// ## Usage
///
/// This component is intended for internal use by `SHDInputOTP`. Typical usage (internal to the parent):
///
/// ```swift
/// SHDInputOTPItem(
///   position: .start,
///   text: $otpDigits[0]
/// )
/// .itemSize(.md)
/// .isError(isError)
/// .onBackspace {
///     // Handle backspace
/// }
/// ```
///
/// - Properties: None exposed beyond those passed in the initializer.
/// - Modifiers:
///     - `itemSize(_:)`: Set the size.
///     - `isError(_:)`: Set the error visual.
///     - `onBackspace(_:)`: Set the backspace action.
/// - Focus and grouping are managed by the parent `SHDInputOTP`.
internal struct SHDInputOTPItem: View {

    private let onValueChange: (String) -> Void = { _ in }
    private let zws = "\u{200B}"
    private var onBackspace: () -> Void = {}
    private var size: SHDInputOTPSizing = .md
    private var state: SHDInputOTPItemBorderStyle

    private var isError: Bool = false

    @Binding private var text: String

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

    func itemSize(_ size: SHDInputOTPSizing = .md) -> Self {
        mutating(keyPath: \.size, value: size)
    }

    func isError(_ isError: Bool = true) -> Self {
        mutating(keyPath: \.isError, value: isError)
    }

    public func onBackspace(_ action: @escaping () -> Void) -> Self {
        mutating(keyPath: \.onBackspace, value: action)
    }
}

#Preview {
    @Previewable @State var text: String = "1"

    SHDInputOTPItem(
        text: $text,
        state: SHDInputOTPItemBorderStyle(
            isStart: true,
            isEnd: true,
            showSeparator: false
        )
    )
}
