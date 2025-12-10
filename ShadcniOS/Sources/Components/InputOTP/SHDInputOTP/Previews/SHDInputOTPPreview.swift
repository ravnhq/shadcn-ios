//
//  SHDInputOTPPreview.swift
//  ShadcniOS
//
//  Created by JoseAlvarez on 12/10/25.
//

import SwiftUI

struct SHDInputOTPPreview: View {
    var body: some View {
        ScrollView {
            Text("Sizes: ")

            VStack {
                HStack {
                    Text("SM:")

                    Spacer()

                    SHDInputOTP()
                        .inputOTPVariants(variant: .pattern, size: .sm)
                        .frame(maxWidth: .infinity)
                }

                Spacer()

                HStack {
                    Text("MD:")

                    Spacer()

                    SHDInputOTP()
                        .inputOTPVariants(variant: .pattern)
                        .frame(maxWidth: .infinity)
                }

                Spacer()

                HStack {
                    Text("LG:")

                    Spacer()

                    SHDInputOTP()
                        .inputOTPVariants(variant: .pattern, size: .lg)
                        .frame(maxWidth: .infinity)
                }
            }
            .padding()

            Spacer()

            VStack {
                Text("Variants: ")
                HStack {
                    Text("Controlled: ")

                    Spacer()
                    SHDInputOTP(
                        caption: "You can add a caption in this variant"
                    )
                    .inputOTPVariants(size: .sm)
                }

                Spacer()

                HStack {
                    Text("Pattern: ")

                    Spacer()

                    SHDInputOTP()
                        .inputOTPVariants(variant: .pattern, size: .sm)
                }

                Spacer()

                HStack {
                    Text("Separator: ")

                    Spacer()

                    SHDInputOTP()
                        .inputOTPVariants(variant: .separator(), size: .sm)
                }
            }
            .padding()

            Spacer()
            VStack {
                Text("Length: ")

                HStack {
                    Text("4 inputs: ")

                    Spacer()

                    SHDInputOTP()
                        .inputOTPVariants(length: .otp4)
                }

                HStack {
                    Text("6 inputs: ")

                    Spacer()

                    SHDInputOTP()

                }

                ScrollView(.horizontal) {
                    HStack {
                        Text("8 inputs: ")

                        Spacer()

                        SHDInputOTP()
                            .inputOTPVariants(length: .otp8)
                    }
                }
            }

            VStack {
                Text("States: ")

                HStack {
                    Text("Default: ")

                    Spacer()

                    SHDInputOTP()
                }

                Spacer()

                HStack {
                    Text("Error: ")

                    Spacer()

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
