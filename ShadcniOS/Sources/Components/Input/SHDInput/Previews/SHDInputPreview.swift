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
    var body: some View {
        VStack(spacing: .md) {
            SHDInput(text: $text, label: "This is the test label", leadingIcon: .mathsX, caption: "This is the caption")

            SHDInput(text: $secondText, label: "This is the test label", leadingIcon: .mathsX, caption: "This is the caption", errorText: "This is the error") { text in
                text.count > 5
            }

            SHDInput(text: $text, label: "This is the test label", leadingIcon: .mathsX, trailingIcon: .mathsX, caption: "This is the caption")
        }
    }
}

#Preview {
    SHDInputPreview()
}
