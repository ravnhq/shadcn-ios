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

            Spacer()
        }
        .padding()
        .previewLayout(.sizeThatFits)
    }
}

#Preview {
    SHDInputPreview()
}
