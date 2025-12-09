//
//  SHDInputOTP.swift
//  ShadcniOS
//
//  Created by JoseAlvarez on 12/9/25.
//

import SwiftUI

struct SHDInputOTP: View {
    @State private var otpDigits: [String] = Array(repeating: "", count: 6)
    @FocusState private var focusedField: Int?

    var variant: SHDInputOTPVariant = .controlled
    var size: SHDInputOTPSizing = .sm

    var body: some View {
        HStack(spacing: 0) {
            ForEach(otpDigits.indices, id: \.self) { index in
                let slotState = SHDInputSlotState.currentState(
                    isFocused: focusedField == index,
                    isError: !otpDigits[index].isEmpty
                )

                if variant.shouldShowSeparator(at: index) {
                    SHDInputOTPSeparator()
                }

                TextField("", text: $otpDigits[index])
                    .frame(width: size.size, height: size.size)
                    .multilineTextAlignment(.center)
                    .tint(.black)
                    .background(
                        SHDInputSlotBorder(
                            index: index,
                            count: otpDigits.count,
                            variant: variant,
                            state: slotState
                        )
                    )
                    .focused($focusedField, equals: index)
                    .padding(.leading, paddingFor(index))
                    .zIndex(slotState.zIndex)
                    .onChange(of: otpDigits[index]) { newValue in
                        handleChange(newValue, at: index)
                    }
            }
        }
    }

    private func paddingFor(_ index: Int) -> CGFloat {
        if index == 0 { return 0 }
        if variant.shouldShowSeparator(at: index) { return 0 }
        return -1
    }

    private func handleChange(_ value: String, at index: Int) {
        if value.count > 1 {
            otpDigits[index] = String(value.prefix(1))
        }

        if value.count == 1, index < otpDigits.count - 1 {
            focusedField = index + 1
        } else if value.isEmpty, index > 0 {
            focusedField = index - 1
        }

        if otpDigits.allSatisfy({ $0.count == 1 }) {
            print("Full:", otpDigits.joined())
        }
    }
}

#Preview {
    VStack {
        SHDInputOTP()
    }
}
