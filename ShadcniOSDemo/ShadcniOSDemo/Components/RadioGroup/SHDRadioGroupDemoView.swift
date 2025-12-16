//
//  SHDRadioGroupDemoView.swift
//  ShadcniOSDemo
//
//  Created by JoseAlvarez on 12/15/25.
//

import ShadcniOS
import SwiftUI

struct SHDRadioGroupDemoView: View {
    @State var selection: SHDRadioGroupSelection = .firstOption
    @State var size: SHDRadioGroupSize = .md
    @State var isDisabled: Bool = false

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
                    selection: $selection,
                    textOption1: "Accept Terms & Conditions",
                    textOption2: "Accept Terms",
                    textOption3: "Accept Conditions"
                )
                .radioGroupStyle(size)
                .disable(isDisabled)
            }
            .padding()
        }
        .navigationTitle("SHDRadioGroup")
    }
}

#Preview {
    SHDRadioGroupDemoView()
}
