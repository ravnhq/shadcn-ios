//
//  SHDInputOTPPreview.swift
//  ShadcniOS
//
//  Created by JoseAlvarez on 12/10/25.
//

import SwiftUI

internal struct SHDInputOTPPreview: View {
    @State var extractedCode: String = ""

    private func row(_ title: String, @ViewBuilder content: () -> some View) -> some View {
        HStack {
            Text(title)
            Spacer()
            content()
                .frame(maxWidth: .infinity)
        }
    }

    private func section(_ title: String, @ViewBuilder content: () -> some View) -> some View {
        VStack(alignment: .leading, spacing: 16) {
            Text(title)
            content()
        }
        .padding(.bottom)
    }

    var body: some View {
        ScrollView {

            section("Sizes:") {
                row("SM:") {
                    SHDInputOTP(code: $extractedCode)
                        .inputOTPConfiguration(variant: .controlled, size: .sm)
                }

                row("MD:") {
                    SHDInputOTP(code: $extractedCode)
                        .inputOTPConfiguration(variant: .controlled)
                }

                row("LG:") {
                    SHDInputOTP(code: $extractedCode)
                        .inputOTPConfiguration(variant: .controlled, size: .lg)
                }
            }

            section("Variants:") {
                row("Controlled:") {
                    SHDInputOTP(
                        code: $extractedCode,
                        caption: "This input OTP has no restrictions"
                    )
                    .inputOTPConfiguration()
                }

                row("Pattern:") {
                    SHDInputOTP(
                        code: $extractedCode,
                        caption: "This input OTP only accepts numbers",
                    )
                    .inputOTPConfiguration(variant: .pattern(.onlyLetters))
                }

                row("Separator:") {
                    SHDInputOTP(code: $extractedCode, caption: "This input OTP is separated by a dot")
                        .inputOTPConfiguration(variant: .separator)
                }
            }

            section("Length:") {
                row("4 inputs:") {
                    SHDInputOTP(code: $extractedCode)
                        .inputOTPConfiguration(length: .short)
                }

                row("6 inputs:") {
                    SHDInputOTP(code: $extractedCode)
                }

                ScrollView(.horizontal) {
                    row("8 inputs:") {
                        SHDInputOTP(code: $extractedCode)
                            .inputOTPConfiguration(length: .extended)
                    }
                }
            }

            section("States:") {
                row("Default:") {
                    SHDInputOTP(code: $extractedCode)
                }

                row("Error:") {
                    SHDInputOTP(code: $extractedCode)
                        .isError()
                }
            }
        }
        .padding()
    }
}

#Preview {
    SHDInputOTPPreview()
}
