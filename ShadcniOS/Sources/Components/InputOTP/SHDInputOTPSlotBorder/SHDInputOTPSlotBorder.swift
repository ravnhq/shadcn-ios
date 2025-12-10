//
//  SHDInputOTPSlotBorder.swift
//  ShadcniOS
//
//  Created by JoseAlvarez on 12/9/25.
//

import SwiftUI

/// Renders the rounded border and stroke for an individual OTP slot.
///
/// ## Description
///
/// `SHDInputSlotBorder` composes an uneven rounded rectangle that adapts its corner radii
/// based on whether the slot is at the start or end of a visual group. It fills the slot
/// background with white and draws a stroked border using the `SHDInputSlotState`'s
/// `borderColor` and `borderWidth` values.
///
/// ## Discussion
///
/// The component determines grouping boundaries using `SHDInputOTPVariant` helper methods
/// (`isStartOfGroup` / `isEndOfGroup`). When fields are grouped (separator variant), adjacent
/// fields combine visually by removing internal corner radii so that groups appear as a single
/// rounded cluster. The stroke color and width are provided by the `SHDInputSlotState`, which
/// encodes idle, focused, and error styles.
///
/// ## Parameters → Init
///
/// - `index`: The zero-based position of this slot within the OTP sequence.
/// - `count`: The total number of slots in the OTP.
/// - `variant`: The `SHDInputOTPVariant` used to determine grouping and separator placement.
/// - `state`: The `SHDInputSlotState` describing current visual state (idle/focused/error).
///
/// ## Usage
///
/// ```swift
/// SHDInputSlotBorder(
///     index: index,
///     count: totalCount,
///     variant: variant,
///     state: SHDInputSlotState.currentState(isFocused: isFocused, isError: isError)
/// )
/// ```
internal struct SHDInputSlotBorder: View {
    let index: Int
    let count: Int
    let variant: SHDInputOTPVariant
    let state: SHDInputSlotState

    private let cornerRadius: CGFloat = SHDSizing.Radius.md.value

    var body: some View {
        let isStart = variant.isStartOfGroup(index: index)
        let isEnd = variant.isEndOfGroup(index: index, totalCount: count)

        let shape = UnevenRoundedRectangle(
            topLeadingRadius: isStart ? cornerRadius : 0,
            bottomLeadingRadius: isStart ? cornerRadius : 0,
            bottomTrailingRadius: isEnd ? cornerRadius : 0,
            topTrailingRadius: isEnd ? cornerRadius : 0
        )

        ZStack {
            shape.fill(Color.white)

            shape.stroke(
                state.borderColor.color,
                lineWidth: state.borderWidth
            )
        }
    }
}
