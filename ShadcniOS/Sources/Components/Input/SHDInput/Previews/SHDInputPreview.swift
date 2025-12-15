//
//  SHDInputPreview.swift
//  ShadcniOS
//
//  Created by Diego Takaki on 12/8/25.
//

import SwiftUI

struct SHDInputPreview: View {
    @State private var text = ""
    @State private var secondText = "aaaa"
    @State private var filledText = "This field is filled"
    @State private var thirdText = ""
    var body: some View {
        VStack(spacing: .md) {
            SHDInput(text: $text,
                     label: "This is the test label",
                     leadingIcon: .mathsX,
                     placeholder: "custom placeholder",
                     caption: "This is the caption")

            SHDInput(text: $secondText,
                     label: "This is the test label",
                     leadingIcon: .mathsX,
                     caption: "This is the caption",
                     errorText: "This is the error") { text in
                text.count > 5
            }

            SHDInput(text: $filledText,
                     label: "This is the test label",
                     leadingIcon: .mathsX,
                     trailingIcon: .mathsX,
                     caption: "This is the caption")
        }

        SHDInput(text: $thirdText,
                 label: "This is the disabled one",
                 leadingIcon: .mathsX,
                 placeholder: "the placeholder",
                 caption: "disabled caption")
            .inputVariant(variant: .disabled, size: .md)
    }
}

#Preview {
    SHDInputPreview()
}
