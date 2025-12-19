//
//  SHDRadioGroupDemoView.swift
//  ShadcniOSDemo
//
//  Created by JoseAlvarez on 12/15/25.
//

import ShadcniOS
import SwiftUI

struct RadioOptionDemo: SHDRadioGroupRepresentable {
    var title: String
}
struct SHDRadioGroupDemoView: View {
    @State var selection: RadioOptionDemo?
    @State var size: SHDRadioGroupSize = .md
    @State var isDisabled: Bool = false
    private var options = [
        RadioOptionDemo(title: "Accept Terms & Conditions"),
        RadioOptionDemo(title: "Accept Terms"),
        RadioOptionDemo(title: "Accept Conditions")

    ]

    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 16) {
                Picker("Size", selection: $size) {
                    Text("Medium").tag(SHDRadioGroupSize.md)
                    Text("Large").tag(SHDRadioGroupSize.lg)
                }
                .pickerStyle(.segmented)
                
                Toggle("Disabled", isOn: $isDisabled)
            }
            .padding()
            
            Divider()
            
            VStack {
                SHDRadioGroup(
                    items: options,
                    selection: $selection
                )
                .radioGroupStyle(size)
                .disabled(isDisabled)
            }
            .padding()
        }
        .navigationTitle("SHDRadioGroup")
    }
}

#Preview {
    SHDRadioGroupDemoView()
}
