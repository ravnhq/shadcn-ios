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

    internal var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Text Inputs")
                .font(.headline)

            SHDTextField(
                text: .constant(""),
                placeholder: "Email address"
            )
            .inputStyle(.sm)

            SHDTextField(
                text: $filledValue,
                placeholder: "Email address"
            )
            .inputStyle(.md)

            SHDTextField(
                text: .constant(""),
                placeholder: "Email address"
            )
            .inputStyle(.lg)
            .disabled(true)

            SHDTextField(
                text: $disabledFilledValue,
                placeholder: "Email address"
            )
            .inputStyle(.md)
            .disabled(true)

            SHDTextField(
                text: .constant(""),
                placeholder: "Search",
                leadingIcon: .notificationBellRing,
                trailingIcon: .mathsX
            )
            .inputStyle(.sm)

            SHDTextField(
                text: .constant(""),
                placeholder: "Search",
                trailingIcon: .mathsX
            )
            .inputStyle(.md)

            SHDTextField(
                text: .constant(""),
                placeholder: "Search",
                leadingIcon: .notificationBellRing
            )
            .inputStyle(.sm)

            Spacer()
        }
        .padding()
        .previewLayout(.sizeThatFits)
    }
}

#Preview {
    SHDInputPreview()
}
