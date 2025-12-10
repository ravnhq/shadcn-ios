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

struct SHDInputSlotBorder: ViewModifier {
    // MARK: Properties

    @FocusState private var isFocused: Bool

    private var borderColor: SHDColor {
        if isFocused {
            .borderPrimaryDefault
        } else if isError {
            .borderDestructiveDefault
        } else {
            .borderDefault
        }
    }

    let isInitialField: Bool
    let isFinalField: Bool
    let isError: Bool

    func body(content: Content) -> some View {
        content
            .focused($isFocused)
            .zIndex(isFocused ? 1 : 0)
            .background {
                UnevenRoundedRectangle(
                    topLeadingRadius: calculateRadius(isInitialField),
                    bottomLeadingRadius: calculateRadius(isInitialField),
                    bottomTrailingRadius: calculateRadius(isFinalField),
                    topTrailingRadius: calculateRadius(isFinalField)
                )
                .fill(.white)
                .stroke(borderColor.color, lineWidth: isFocused ? 2 : 1)
            }
    }

    // MARK: Private Methods

    private func calculateRadius(_ shouldBend: Bool) -> CGFloat {
        shouldBend ? SHDSizing.Radius.md.value : 0
    }
}

extension View {
    func border(isInitialField: Bool, isFinalField: Bool, isError: Bool)
        -> some View
    {
        modifier(
            SHDInputSlotBorder(
                isInitialField: isInitialField,
                isFinalField: isFinalField,
                isError: isError
            )
        )
    }
}
