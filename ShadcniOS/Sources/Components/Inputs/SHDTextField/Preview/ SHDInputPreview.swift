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
        VStack(alignment: .leading, spacing: 16) {
            Text("Text Inputs")
                .textStyle(.textBaseSemibold)

            SHDTextField(
                placeholder: "Email address",
                text: .constant("")
            )
            .inputStyle(.sm)

            SHDTextField(
                placeholder: "Email address",
                text: $filledValue
            )
            .inputStyle(.md)

            SHDTextField(
                placeholder: "Email address",
                text: .constant("")
            )
            .inputStyle(.lg)
            .disabled(true)

            SHDTextField(
                placeholder: "Email address",
                text: $disabledFilledValue
            )
            .inputStyle(.md)
            .disabled(true)

            SHDTextField(
                placeholder: "Search",
                leadingIcon: .notificationBellRing,
                trailingIcon: .mathsX,
                text: .constant("")
            )
            .inputStyle(.sm)

            SHDTextField(
                placeholder: "Search",
                trailingIcon: .mathsX,
                text: .constant("")
            )
            .inputStyle(.md)

            SHDTextField(
                placeholder: "Search",
                leadingIcon: .notificationBellRing,
                text: .constant("")
            )
            .inputStyle(.sm)

            Text("With Inline Error")
                .textStyle(.textBaseSemibold)

            SHDTextField(
                placeholder: "Email address",
                text: $errorValue
            )
            .inputStyle(.md)
            .shdInlineError("Please enter a valid email address")

            Text("Secure Field")
                .textStyle(.textBaseSemibold)

            SHDTextField(
                placeholder: "Password",
                text: $passwordValue
            )
            .inputStyle(.md)
            .shdSecureField(true)

            Spacer()
        }
        .padding()
        .previewLayout(.sizeThatFits)
    }
}

#Preview {
    SHDInputPreview()
}
