//
//  SHDInputDemoView.swift
//  ShadcniOSDemo
//
//  Created by Diego Takaki on 12/8/25.
//

import SwiftUI
import ShadcniOS

struct SHDInputDemoView: View {

    @State private var text: String = ""
    @State private var secondText: String = ""
    @State private var fontSize: SHDInputSize = .md
    @State private var inputVariant: SHDInputVariant = .default

    var body: some View {
        VStack(spacing: 10) {
            VStack {
                Text("Font size")
                Picker("Font Size", selection: $fontSize) {
                    Text("SM").tag(SHDInputSize.sm)
                    Text("MD").tag(SHDInputSize.md)
                    Text("LG").tag(SHDInputSize.lg)
                }
                .pickerStyle(.segmented)
            }
            
            
            SHDInput(text: $text, label: "This is the label", leadingIcon: .notificationBellOff, caption: "This is the caption")
                .inputVariant(variant: inputVariant, size: fontSize)
            
            SHDInput(text: $secondText, label: "This is the label", leadingIcon: .notificationBellOff, caption: "This is the caption", errorText: "This is the errorText", validation: { text in
                text.count > 5
            })
                .inputVariant(variant: inputVariant, size: fontSize)
        }
        
    }
}

#Preview {
    SHDInputDemoView()
}
