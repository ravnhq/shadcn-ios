//
//  SHDInputPreview.swift
//  ShadcniOS
//
//  Created by Concepción Orellana on 15/4/25.
//

import SwiftUI

internal struct SHDInputPreview: View {
    @State private var filledValue = "hello@shadcn.com"
    @State private var disabledFilledValue = "hello@shadcn.com"
    @State private var errorValue = "invalid-email"
    @State private var passwordValue = "password123"

    internal var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Text("Text Inputs")
                    .textStyle(.textBaseSemibold)

                SHDFormInput(
                    label: "Email",
                    caption: "We will never share your email."
                ) {
                    SHDTextField(
                        placeholder: "Email address",
                        text: .constant("")
                    )
                    .inputStyle(.sm)
                }

                SHDFormInput(
                    label: "Email",
                    caption: "Use your work email."
                ) {
                    SHDTextField(
                        placeholder: "Email address",
                        text: $filledValue
                    )
                    .inputStyle(.md)
                }

                SHDFormInput(
                    label: "Email",
                    caption: "Disabled example."
                ) {
                    SHDTextField(
                        placeholder: "Email address",
                        text: .constant("")
                    )
                    .inputStyle(.lg)
                    .disabled(true)
                }

                SHDFormInput(
                    label: "Email",
                    caption: "Disabled with text."
                ) {
                    SHDTextField(
                        placeholder: "Email address",
                        text: $disabledFilledValue
                    )
                    .inputStyle(.md)
                    .disabled(true)
                }

                SHDFormInput(
                    label: "Search",
                    caption: "With leading and trailing icons."
                ) {
                    SHDTextField(
                        placeholder: "Search",
                        leadingIcon: .notificationBellRing,
                        trailingIcon: .mathsX,
                        text: .constant("")
                    )
                    .inputStyle(.sm)
                }

                SHDFormInput(
                    label: "Search",
                    caption: "Trailing icon only."
                ) {
                    SHDTextField(
                        placeholder: "Search",
                        trailingIcon: .mathsX,
                        text: .constant("")
                    )
                    .inputStyle(.md)
                }

                SHDFormInput(
                    label: "Search",
                    caption: "Leading icon only."
                ) {
                    SHDTextField(
                        placeholder: "Search",
                        leadingIcon: .notificationBellRing,
                        text: .constant("")
                    )
                    .inputStyle(.sm)
                }

                Text("With Inline Error")
                    .textStyle(.textBaseSemibold)

                SHDTextField(
                    placeholder: "Email address",
                    text: $errorValue
                )
                .inputStyle(.md)
                .inlineError("Please enter a valid email address")

                Text("Secure Field")
                    .textStyle(.textBaseSemibold)

                SHDSecureField(
                    placeholder: "Password",
                    text: $passwordValue
                )
                .inputStyle(.md)

                Text("Form Inputs")
                    .textStyle(.textBaseSemibold)

                SHDFormInput(
                    label: "Email",
                    caption: "Inline error replaces the caption."
                ) {
                    SHDTextField(
                        placeholder: "Email address",
                        text: $errorValue
                    )
                    .inputStyle(.md)
                }
                .inlineError("Please enter a valid email address")

                SHDFormInput(
                    label: "Password",
                    caption: "Secure input with visibility toggle."
                ) {
                    SHDSecureField(
                        placeholder: "Password",
                        text: $passwordValue
                    )
                    .inputStyle(.md)
                }

                Spacer()
            }
            .padding()
            .previewLayout(.sizeThatFits)
        }
    }
}

#Preview {
    SHDInputPreview()
}
