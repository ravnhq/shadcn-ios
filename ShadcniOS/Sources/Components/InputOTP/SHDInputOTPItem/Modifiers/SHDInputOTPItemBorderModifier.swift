//
//  SHDInputOTPItemBorderModifier.swift
//  ShadcniOS
//
//  Created by Samuel Cornejo on 2025-12-24.
//

import SwiftUI

/// A view modifier that applies a rounded border with focus and error states to an OTP input slot.
///
/// ## Overview
///
/// `SHDInputSlotBorder` is a `ViewModifier` that adds a background with an uneven rounded rectangle
/// to create the visual border for OTP input slots. It handles focus states internally and adjusts
/// the border color and width based on focus and error conditions.
///
/// The modifier uses `UnevenRoundedRectangle` to create borders that can be rounded on specific corners
/// depending on the slot's position in a group, allowing adjacent slots to appear as a single unit.
///
/// ## Parameters
///
/// - `position`: The position of the slot (start, middle, end, single)
///      to determine which corners should be rounded.
/// - `isError`: A Boolean indicating whether the slot should display an error state.
///
/// ## Usage
///
/// This modifier is used internally by `SHDInputOTPItem` to apply the border styling:
///
/// ```swift
/// TextField("", text: $text)
///     .modifier(SHDInputSlotBorder(position: .start, isError: false))
/// ```
///
/// Or using the convenience extension:
///
/// ```swift
/// TextField("", text: $text)
///     .border(position: .start, isError: false)
/// ``
struct SHDInputOTPItemBorderModifier: ViewModifier {
    @FocusState private var isFocused: Bool

    let state: SHDInputOTPItemBorderStyle
    let isError: Bool

    private let cornerRadius: SHDSizing.Radius = .md

    private var borderColor: SHDColor {
        if isFocused {
            .borderPrimaryDefault
        } else if isError {
            .borderDestructiveDefault
        } else {
            .borderDefault
        }
    }

    func body(content: Content) -> some View {
        content
            .focused($isFocused)
            .zIndex(isFocused ? 1 : 0)
            .background {
                UnevenRoundedRectangle(
                    topLeadingRadius: calculateRadius(state.isStart),
                    bottomLeadingRadius: calculateRadius(state.isStart),
                    bottomTrailingRadius: calculateRadius(state.isEnd),
                    topTrailingRadius: calculateRadius(state.isEnd)
                )
                .fill(.white)
                .stroke(borderColor.color, lineWidth: isFocused ? 2 : 1)
            }
    }

    private func calculateRadius(_ shouldBend: Bool) -> CGFloat {
        shouldBend ? SHDSizing.Radius.md.value : 0
    }

}

extension View {
    func otpBorder(state: SHDInputOTPItemBorderStyle, isError: Bool) -> some View {
        modifier(
            SHDInputOTPItemBorderModifier(
                state: state,
                isError: isError
            )
        )
    }
}
