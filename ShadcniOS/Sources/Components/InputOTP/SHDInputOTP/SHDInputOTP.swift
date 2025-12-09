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

    private let cornerRadius: CGFloat = SHDSizing.Radius.md.value

    var body: some View {
        HStack(spacing: SHDSizing.Spacing.none) {
            ForEach(otpDigits.indices, id: \.self) { index in
                TextField("", text: $otpDigits[index])
                    .frame(width: 40, height: 40)
                    .multilineTextAlignment(.center)
                    .tint(.borderPrimaryDefault)
                    .background(border(for: index))
                    .focused($focusedField, equals: index)
                    .padding(.leading, index == 0 ? 0 : -1)
                    .zIndex(focusedField == index ? 1 : 0)
                    .onChange(of: otpDigits[index]) { newValue in
                        handleChange(newValue, at: index)
                    }
            }
        }
    }

    private func border(for index: Int) -> some View {
        let isFirst = index == 0
        let isLast = index == otpDigits.count - 1

        let tlRadius: CGFloat = isFirst ? cornerRadius : 0
        let blRadius: CGFloat = isFirst ? cornerRadius : 0
        let trRadius: CGFloat = isLast ? cornerRadius : 0
        let brRadius: CGFloat = isLast ? cornerRadius : 0

        let shape = UnevenRoundedRectangle(
            topLeadingRadius: tlRadius,
            bottomLeadingRadius: blRadius,
            bottomTrailingRadius: brRadius,
            topTrailingRadius: trRadius
        )

        return ZStack {
            shape.stroke(
                focusedField == index ? .borderPrimaryDefault : .borderDefault,
                lineWidth: focusedField == index ? 2 : 1
            )
        }
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

        checkFullFilled()
    }

    private func checkFullFilled() {
        if otpDigits.allSatisfy({ $0.count == 1 }) {
            print("The OTP is full:", otpDigits.joined())
        }
    }
}

#Preview {
    SHDInputOTP()
}
