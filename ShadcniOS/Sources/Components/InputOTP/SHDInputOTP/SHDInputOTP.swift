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

    var body: some View {
        HStack {
            ForEach(0..<otpDigits.count, id: \.self) { index in
                TextField("", text: $otpDigits[index])
                    .frame(width: 40, height: 40)
                    .multilineTextAlignment(.center)
                    .background(
                        RoundedRectangle(    cornerRadius: (index == 0 || index == otpDigits.count - 1) ? .lg : 0).stroke(
                            .borderDefault,
                            lineWidth: 1
                        )
                    )
                    .focused($focusedField, equals: index)
                    .onChange(of: otpDigits[index]) { newValue in
                        if newValue.count > 1 {
                            otpDigits[index] = String(newValue.prefix(1))
                        }
                        if newValue.count == 1 && index < otpDigits.count - 1 {
                            focusedField = index + 1
                        } else if newValue.isEmpty && index > 0 {
                            focusedField = index - 1
                        }
                        checkFullFilled()
                    }
            }
        }
    }

    func checkFullFilled() {
        let fullOTP = otpDigits.joined()
        if fullOTP.count == otpDigits.count {
            print("The otp is full")
        }
    }
}

#Preview {
    SHDInputOTP()
}
