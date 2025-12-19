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

            SHDTextInput(
                text: .constant(""),
                placeholder: "Email address"
            )

            SHDTextInput(
                text: $filledValue,
                placeholder: "Email address"
            )

            SHDTextInput(
                text: .constant(""),
                placeholder: "Email address"
            )
            .disabled(true)

            SHDTextInput(
                text: $disabledFilledValue,
                placeholder: "Email address"
            )
            .disabled(true)

            SHDTextInput(
                text: .constant(""),
                placeholder: "Search",
                leadingIcon: .notificationBellRing,
                trailingIcon: .mathsX
            )

            SHDTextInput(
                text: .constant(""),
                placeholder: "Search",
                trailingIcon: .mathsX
            )

            SHDTextInput(
                text: .constant(""),
                placeholder: "Search",
                leadingIcon: .notificationBellRing
            )

            Spacer()
        }
        .padding()
        .previewLayout(.sizeThatFits)
    }
}

#Preview {
    SHDInputPreview()
}
