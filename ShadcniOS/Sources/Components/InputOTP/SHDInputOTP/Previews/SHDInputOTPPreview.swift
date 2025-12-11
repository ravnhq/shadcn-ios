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
                        .inputOTPVariants(variant: .pattern, size: .sm)
                }

                row("MD:") {
                    SHDInputOTP()
                        .inputOTPVariants(variant: .pattern)
                }

                row("LG:") {
                    SHDInputOTP()
                        .inputOTPVariants(variant: .pattern, size: .lg)
                }
            }

            section("Variants:") {
                row("Controlled:") {
                    SHDInputOTP(caption: "You can add a caption in this variant")
                        .inputOTPVariants(size: .sm)
                }

                row("Pattern:") {
                    SHDInputOTP()
                        .inputOTPVariants(variant: .pattern, size: .sm)
                }

                row("Separator:") {
                    SHDInputOTP()
                        .inputOTPVariants(variant: .separator(), size: .sm)
                }
            }

            // MARK: Length
            section("Length:") {
                row("4 inputs:") {
                    SHDInputOTP()
                        .inputOTPVariants(length: .otp4)
                }

                row("6 inputs:") {
                    SHDInputOTP()
                }

                ScrollView(.horizontal) {
                    row("8 inputs:") {
                        SHDInputOTP()
                            .inputOTPVariants(length: .otp8)
                    }
                }
            }

            // MARK: States
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
