//
//  SHDInputPreview.swift
//  ShadcniOS
//
//  Created by Concepción Orellana on 15/4/25.
//

import SwiftUI

internal struct SHDInputPreview: View {
    @State private var emptyValue = ""
    @State private var filledValue = "hello@shadcn.com"
    @State private var disabledEmptyValue = ""
    @State private var fdisabledFilledValue = "hello@shadcn.com"

    internal var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Text Inputs")
                .font(.headline)

            SHDTextInput(text: $emptyValue, placeholder: "Email address")

            SHDTextInput(text: $filledValue, placeholder: "Email address")

            SHDTextInput(text: $disabledEmptyValue, placeholder: "Email address")
                .disabled(true)

            SHDTextInput(text: $fdisabledFilledValue, placeholder: "Email address")
                .disabled(true)

            Spacer()
        }
        .padding()
        .previewLayout(.sizeThatFits)
    }
}

#Preview {
    SHDInputPreview()
}
