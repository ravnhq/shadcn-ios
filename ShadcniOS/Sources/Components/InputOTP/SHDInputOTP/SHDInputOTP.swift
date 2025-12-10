//
//  SHDInputOTP.swift
//  ShadcniOS
//
//  Created by JoseAlvarez on 12/9/25.
//

import SwiftUI

public struct SHDInputOTP: View {
    @State private var otpDigits: [String] = []
    @FocusState private var focusedField: Int?

    private var caption: String = ""
    private var variant: SHDInputOTPVariant = .controlled
    private var size: SHDInputOTPSizing = .md
    private var isError: Bool = false
    private var length: SHDInputOTPLength = .otp6

    public init(caption: String = "") {
        self.caption = caption
    }

    public var body: some View {
        VStack(spacing: .sm) {
            HStack(spacing: 0) {
                ForEach(otpDigits.indices, id: \.self) { index in
                    if variant.shouldShowSeparator(at: index) {
                        SHDInputOTPSeparator()
                    }

                    SHDInputOTPItem(
                        index: index,
                        count: otpDigits.count,
                        text: $otpDigits[index],
                        focusedField: $focusedField,
                        variant: variant,
                        size: size,
                        onValueChange: { newValue in
                            handleLogicChange(newValue, at: index)
                        },
                        isError: isError
                    )
                }
            }
            if variant == .controlled {
                Text(caption)
                    .textStyle(size.textStyle)
            }
        }
        .onAppear {
            otpDigits = Array(repeating: "", count: length.digits)
        }
        .onChange(of: length) { newLength in
            otpDigits = Array(repeating: "", count: newLength.digits)
            focusedField = 0
        }
    }

    private func handleLogicChange(_ value: String, at index: Int) {
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

    public func inputOTPVariants(
        variant: SHDInputOTPVariant = .controlled,
        size: SHDInputOTPSizing = .md,
        length: SHDInputOTPLength = .otp6
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
}

#Preview {
    SHDInputOTPPreview()
}
