//
//  SwiftUIView.swift
//  ShadcniOS
//
//  Created by Diego Takaki on 12/8/25.
//

import SwiftUI

struct SHDInputPreview: View {
    @State private var text = ""
    var body: some View {
        SHDInput(text: $text, label: "This is the test label",leadingIcon: .mathsX, caption: "This is the caption")
    }
}

#Preview {
    SHDInputPreview()
}
