//
//  SHDInputOTPItem.swift
//  ShadcniOS
//
//  Created by JoseAlvarez on 12/9/25.
//

import SwiftUI

/// A single input field used by `SHDInputOTP` to render and manage one character in an OTP code.
///
/// ## Overview
///
/// `SHDInputOTPItem` is an internal view representing a single text field for one character
/// of a One-Time Password. It handles visual state, error indication, and sizing. Focus and
/// value propagation are managed by the parent `SHDInputOTP`; this component itself no longer manages
/// focus, group/slot position, or custom per-slot background styling.
///
/// - The only state managed internally is the size, error, and the field text binding.
/// - Sizing can be set with `.itemSize(_:)`.
/// - Error state can be set with `.isError(_:)`.
///
/// ## Initialization
///
/// - `isInitialField`: Whether this item is visually the first input slot.
/// - `isFinalField`: Whether this item is visually the last input slot.
/// - `text`: A two-way `Binding<String>` for this slot's text value (should be a single character).
///
/// ## Modifiers
///
/// - `.itemSize(_:)`: Sets the visual size of the input field.
/// - `.isError(_:)`: Sets the error visual state of the input field.
///
/// ## Usage
///
/// This component is intended for internal use by `SHDInputOTP`. Typical usage (internal to the parent):
///
/// ```swift
/// SHDInputOTPItem(
///   isInitialField: true,
///   isFinalField: false,
///   text: $otpDigits[0]
/// )
/// .itemSize(.md)
/// .isError(isError)
/// ```
///
/// ## Public API
///
/// - Properties: None exposed beyond those passed in the initializer.
/// - Modifiers:
///     - `itemSize(_:)`: Set the size.
///     - `isError(_:)`: Set the error visual.
/// - All other visual and behavioral concerns (focus, grouping, separators, callbacks) are now
///   managed by the parent `SHDInputOTP` and not exposed here.
//
internal struct SHDInputOTPItem: View {
    // MARK: Properties

    private var size: SHDInputOTPSizing = .md
    private var isError: Bool = false
    private var onBackspace: () -> Void = {}
    let onValueChange: (String) -> Void = { _ in }
    private var zws = "\u{200B}"
    private let isInitialField: Bool
    private let isFinalField: Bool

    @Binding private var text: String

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
                    let cleanValue = newValue.replacingOccurrences(
                        of: zws,
                        with: ""
                    )

                    if cleanValue != text {
                        text = cleanValue
                    }
                }
            )
        )
        .contentShape(Rectangle())
        .lineLimit(1)
        .multilineTextAlignment(.center)
        .textInputAutocapitalization(.characters)
        .frame(width: size.textFieldSize, height: size.textFieldSize)
        .tint(.borderPrimaryDefault)
        .border(
            isInitialField: isInitialField,
            isFinalField: isFinalField,
            isError: isError
        )
        .onChange(of: text) { newValue in
            if newValue == zws { return }
            onValueChange(newValue)
        }
    }

    // MARK: Initializer

    init(
        isInitialField: Bool = false,
        isFinalField: Bool = false,
        text: Binding<String>
    ) {
        self.isInitialField = isInitialField
        self.isFinalField = isFinalField
        _text = text
    }

    // MARK: Public Methods

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

    SHDInputOTPItem(isInitialField: true, text: $text)
}
