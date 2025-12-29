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
                    SHDInputOTPControlled(code: $extractedCode)
                        .inputOTPConfiguration(variant: .joined, size: .sm)
                }

                row("MD:") {
                    SHDInputOTPControlled(code: $extractedCode)
                        .inputOTPConfiguration(variant: .joined)
                }

                row("LG:") {
                    SHDInputOTPControlled(code: $extractedCode)
                        .inputOTPConfiguration(variant: .joined, size: .lg)
                }
            }

            section("Variants:") {
                row("Controlled:") {
                    SHDInputOTPControlled(
                        code: $extractedCode,
                        caption: "This input OTP has no restrictions"
                    )
                    .inputOTPConfiguration()
                }

                row("Pattern:") {
                    SHDInputOTPPattern(
                        code: $extractedCode,
                        caption: "This input OTP only accepts numbers",
                        pattern: .onlyNumbers
                    )
                    .inputOTPConfiguration()
                }

                row("Separator:") {
                    SHDInputOTPControlled(code: $extractedCode, caption: "This input OTP is separated by a dot")
                        .inputOTPConfiguration(variant: .separator)
                }
            }

            section("Length:") {
                row("4 inputs:") {
                    SHDInputOTPControlled(code: $extractedCode)
                        .inputOTPConfiguration(length: .short)
                }

                row("6 inputs:") {
                    SHDInputOTPControlled(code: $extractedCode)
                }

                ScrollView(.horizontal) {
                    row("8 inputs:") {
                        SHDInputOTPControlled(code: $extractedCode)
                            .inputOTPConfiguration(length: .extended)
                    }
                }
            }

            section("States:") {
                row("Default:") {
                    SHDInputOTPControlled(code: $extractedCode)
                }

                row("Error:") {
                    SHDInputOTPControlled(code: $extractedCode)
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
