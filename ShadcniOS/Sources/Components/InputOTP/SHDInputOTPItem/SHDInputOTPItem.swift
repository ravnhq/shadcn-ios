//
//  SHDInputOTPItem.swift
//  ShadcniOS
//
//  Created by JoseAlvarez on 12/9/25.
//

import SwiftUI

struct SHDInputOTPItem: View {
    let index: Int
    let count: Int
    @Binding var text: String

    var focusedField: FocusState<Int?>.Binding

    let variant: SHDInputOTPVariant
    let size: SHDInputOTPSizing

    var onValueChange: (String) -> Void
    var isError: Bool

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
        if variant.shouldShowSeparator(at: index) { return 0 }
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
                    state: slotState
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
