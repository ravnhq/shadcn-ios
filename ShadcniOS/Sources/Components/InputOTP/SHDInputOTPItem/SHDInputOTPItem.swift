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
/// and grouping information derived from the variant and length. Focus is controlled via a
/// `FocusState` binding passed from the parent, enabling auto-advance and auto-regress
/// behavior implemented in `SHDInputOTP`.
///
/// The component computes a leading padding adjustment to visually collapse adjacent borders
/// when separators are used or when the field is the first in the sequence.
///
/// ## Parameters → Init
///
/// - `index`: The zero-based position of this slot within the OTP sequence.
/// - `count`: The total number of OTP slots being displayed.
/// - `text`: A two-way binding to the slot's text value (single character).
/// - `focusedField`: A `FocusState` binding shared with the parent to control keyboard focus.
/// - `variant`: The selected `SHDInputOTPVariant` determining separators and grouping behavior.
/// - `size`: The `SHDInputOTPSizing` value that determines field dimensions and typography.
/// - `length`: The `SHDInputOTPLength` value used together with the variant to compute grouping.
/// - `onValueChange`: Callback invoked whenever the slot's text changes.
/// - `isError`: Boolean indicating whether the component should display error styling.
///
/// ## Usage
///
/// This is used internally by `SHDInputOTP` and is not typically constructed directly by consumers.
/// Example (internal usage):
///
/// ```swift
/// SHDInputOTPItem(
///   index: 0,
///   count: 6,
///   text: $otpDigits[0],
///   focusedField: $focusedField,
///   variant: .controlled,
///   size: .md,
///   onValueChange: { newValue in /* parent logic */ },
///   isError: false
/// )
/// ```
///
/// ## Variables → Public variables
///
/// - `index`, `count`, `text`, `focusedField`, `variant`, `size`, `length`, `onValueChange`, `isError`
///   are provided by the parent; the view does not expose additional public state.
///
/// ## Functions → Public functions
///
/// No public functions. Interaction is driven by bindings and the `onValueChange` callback.
internal struct SHDInputOTPItem: View {
    @Binding var text: String

    let index: Int
    let count: Int
    let variant: SHDInputOTPVariant
    let size: SHDInputOTPSizing
    let length: SHDInputOTPLength
    let focusedField: FocusState<Int?>.Binding
    let onValueChange: (String) -> Void
    let isError: Bool

    private var isActive: Bool {
        focusedField.wrappedValue == index
    }

    private var slotState: SHDInputSlotState {
        SHDInputSlotState.currentState(
            isFocused: isActive,
            isError: isError
        )
    }

    private var leadingPadding: CGFloat {
        if index == 0 { return 0 }
        if variant.shouldShowSeparator(at: index, length: length) { return 0 }
        return -1
    }

    var body: some View {
        TextField("", text: $text)
            .frame(width: size.size, height: size.size)
            .multilineTextAlignment(.center)
            .tint(SHDColor.borderPrimaryDefault.color)
            .background(
                SHDInputSlotBorder(
                    index: index,
                    count: count,
                    variant: variant,
                    state: slotState,
                    length: length
                )
            )
            .foregroundColor(.primary)
            .focused(focusedField, equals: index)
            .padding(.leading, leadingPadding)
            .zIndex(slotState.zIndex)
            .onChange(of: text) { newValue in
                onValueChange(newValue)
            }
    }
}
