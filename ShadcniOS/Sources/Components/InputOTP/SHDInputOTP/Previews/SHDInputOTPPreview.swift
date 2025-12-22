//
//  SHDInputOTPPreview.swift
//  ShadcniOS
//
//  Created by JoseAlvarez on 12/10/25.
//

import SwiftUI

internal struct SHDInputOTPPreview: View {
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
                    SHDInputOTP()
                        .inputOTPConfiguration(variant: .pattern, size: .sm)
                }

                row("MD:") {
                    SHDInputOTP()
                        .inputOTPConfiguration(variant: .pattern)
                }

                row("LG:") {
                    SHDInputOTP()
                        .inputOTPConfiguration(variant: .pattern, size: .lg)
                }
            }

            section("Variants:") {
                row("Controlled:") {
                    SHDInputOTP(caption: "You can add a caption in this variant")
                        .inputOTPConfiguration(size: .sm)
                }

                row("Pattern:") {
                    SHDInputOTP()
                        .inputOTPConfiguration(variant: .pattern, size: .sm)
                }

                row("Separator:") {
                    SHDInputOTP()
                        .inputOTPConfiguration(variant: .separator(), size: .sm)
                }
            }

            section("Length:") {
                row("4 inputs:") {
                    SHDInputOTP()
                        .inputOTPConfiguration(length: .otp4)
                }

                row("6 inputs:") {
                    SHDInputOTP()
                }

                ScrollView(.horizontal) {
                    row("8 inputs:") {
                        SHDInputOTP()
                            .inputOTPConfiguration(length: .otp8)
                    }
                }
            }

            section("States:") {
                row("Default:") {
                    SHDInputOTP()
                }

                row("Error:") {
                    SHDInputOTP()
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
