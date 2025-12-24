//
//  SHDInputOTPItem.swift
//  ShadcniOS
//
//  Created by JoseAlvarez on 12/9/25.
//

import SwiftUI

/// A single input slot used by `SHDInputOTP` to render and manage one character of the OTP.
///
/// ## Description
///
/// `SHDInputOTPItem` encapsulates the UI and interaction logic for a single OTP character field.
/// It is intended for internal use by `SHDInputOTP` and coordinates focus, visual state,
/// sizing, length-aware grouping, and change propagation for one character in the OTP sequence.
///
/// ## Discussion
///
/// The view uses a `TextField` restricted to a single character and applies a background
/// border view (`SHDInputSlotBorder`) that adapts its appearance based on focus, error state,
/// and grouping information derived from the variant and length. Focus is controlled internally
/// via a `@FocusState` property, enabling auto-advance and auto-regress
/// behavior implemented in `SHDInputOTP`.
///
/// The component computes a leading padding adjustment to visually collapse adjacent borders
/// when separators are used or when the field is the first in the sequence.
///
/// ## Parameters → Init
///
/// - `text`: A two-way `Binding<String>` to the slot's text value (single character).
/// - `tag`: The zero-based tag/index for this slot used with the focus binding.
/// - `focusedField`: A `FocusState<Int?>.Binding` used to control per-slot focus from the parent.
/// - `onValueChange`: Callback invoked whenever the slot's text changes.
/// - `variant`, `size`, `length`: Visual/configuration values applied via the
///   `inputOTPItemConfiguration(...)` modifier from the parent.
/// - `isFirst`, `isLast`, `showLeftSeparator`, `isStartOfGroup`, `isEndOfGroup`:
///   Flags provided by the parent to indicate position and grouping for styling.
/// - `onValueChange`: Callback invoked whenever the slot's text changes.
/// - `variant`, `size`, `length`: Visual/configuration values applied via the
///   `inputOTPItemConfiguration(...)` modifier from the parent.
/// - `isFirst`, `isLast`, `showLeftSeparator`, `isStartOfGroup`, `isEndOfGroup`:
///   Flags provided by the parent to indicate position and grouping for styling.
///
/// ## Usage
///
/// This is used internally by `SHDInputOTP` and is not typically constructed directly by consumers.
/// Example (internal usage by `SHDInputOTP`):
///
/// ```swift
/// SHDInputOTPItem(
///   text: $otpDigits[0],
///   tag: 0,
///   focusedField: $focusedField,
///   onValueChange: { newValue in /* parent logic */ },
///   isFirst: true,
///   isLast: false,
///   showLeftSeparator: false,
///   isStartOfGroup: true,
///   isEndOfGroup: false
/// )
///   onValueChange: { newValue in /* parent logic */ },
///   isFirst: true,
///   isLast: false,
///   showLeftSeparator: false,
///   isStartOfGroup: true,
///   isEndOfGroup: false
/// ```
///
/// ## Variables → Public variables
///
/// - `index`, `count`, `text`, `variant`, `size`, `length`, `onValueChange`, `isError`
///   are provided by the parent; the view does not expose additional public state.
///
/// ## Functions → Public functions
///
/// No public functions. Interaction is driven by bindings and the `onValueChange` callback.
/// - `text`, `variant`, `size`, `length`, `onValueChange`, `isError`, and positional
///   flags (`isFirst`, `isLast`, `showLeftSeparator`, `isStartOfGroup`, `isEndOfGroup`)
///   are provided by the parent; the view does not expose additional public state.
internal struct SHDInputOTPItem: View {
    @Environment(\.isFocused) private var isFocused
    @Binding var text: String
    @FocusState private var internalFocus: Bool
    private let zws = "\u{200B}"
    let onValueChange: (String) -> Void
    var onBackspace: () -> Void = {}
    var variant: SHDInputOTPVariant = .controlled
    var size: SHDInputOTPSizing = .md
    var length: SHDInputOTPLength = .standard
    var isError: Bool = false
    var isFirst: Bool = false
    var isLast: Bool = false
    var showLeftSeparator: Bool = false
    var isStartOfGroup: Bool = false
    var isEndOfGroup: Bool = false

    private var slotState: SHDInputSlotState {
        SHDInputSlotState.currentState(
            isFocused: internalFocus,
            isError: isError
        )
    }

    private var leadingPadding: CGFloat {
        if isFirst || showLeftSeparator { return 0 }
        return -1
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
        .lineLimit(1)
        .frame(width: size.textFieldSize, height: size.textFieldSize)
        .multilineTextAlignment(.center)
        .textInputAutocapitalization(.characters)
        .tint(SHDColor.borderPrimaryDefault.color)
        .focused($internalFocus)
        .background(
            SHDInputSlotBorder()
                .inputSlotBorderConfiguration(
                    state: slotState,
                    isStartOfGroup: isStartOfGroup,
                    isEndOfGroup: isEndOfGroup
                )
        )
        .contentShape(Rectangle())
        .foregroundColor(.foregroundDefault)
        .padding(.leading, leadingPadding)
        .zIndex(slotState.zIndex)
        .onChange(of: text) { newValue in
            if newValue == zws { return }
            onValueChange(newValue)
        }
    }

    public func inputOTPItemConfiguration(
        variant: SHDInputOTPVariant = .controlled,
        size: SHDInputOTPSizing = .md,
        length: SHDInputOTPLength = .standard
    ) -> Self {
        mutating { inputOTP in
            inputOTP.variant = variant
            inputOTP.size = size
            inputOTP.length = length
        }
    }

    public func isError(_ isError: Bool = true) -> Self {
        mutating(keyPath: \.isError, value: isError)
    }
    
    public func onBackspace(_ action: @escaping () -> Void) -> Self {
        mutating(keyPath: \.onBackspace, value: action)
    }
}
