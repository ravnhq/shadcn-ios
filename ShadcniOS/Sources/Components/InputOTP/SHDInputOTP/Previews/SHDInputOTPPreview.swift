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
                        .inputOTPConfiguration(variant: .pattern, size: .sm)
                }

                row("MD:") {
                    SHDInputOTP(code: $extractedCode)
                        .inputOTPConfiguration(variant: .pattern)
                }

                row("LG:") {
                    SHDInputOTP(code: $extractedCode)
                        .inputOTPConfiguration(variant: .pattern, size: .lg)
                }
            }

            section("Variants:") {
                row("Controlled:") {
                    SHDInputOTP(caption: "You can add a caption in this variant", code: $extractedCode)
                        .inputOTPConfiguration(size: .sm)
                }

                row("Pattern:") {
                    SHDInputOTP(code: $extractedCode)
                        .inputOTPConfiguration(variant: .pattern, size: .sm)
                }

                row("Separator:") {
                    SHDInputOTP(code: $extractedCode)
                        .inputOTPConfiguration(variant: .separator, size: .sm)
                }
            }

            section("Length:") {
                row("4 inputs:") {
                    SHDInputOTP(code: $extractedCode)
                        .inputOTPConfiguration(length: .otp4)
                }

                row("6 inputs:") {
                    SHDInputOTP(code: $extractedCode)
                }

                ScrollView(.horizontal) {
                    row("8 inputs:") {
                        SHDInputOTP(code: $extractedCode)
                            .inputOTPConfiguration(length: .otp8)
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
