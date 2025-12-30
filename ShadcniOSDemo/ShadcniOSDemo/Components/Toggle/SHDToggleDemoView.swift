//
//  SHDToggleDemoView.swift
//  ShadcniOSDemo
//
//  Created by Diego Takaki on 12/26/25.
//

import SwiftUI
import ShadcniOS

struct SHDToggleDemoView: View {
    
    @State private var disabled: Bool = false
    @State private var isActive: Bool = false
    @State private var isIconActive: Bool = false
    @State private var isTextActive: Bool = false
    @State private var toggleSize: SHDButtonSize = .md
    @State private var toggleVariant: SHDToggleVariant = .default

    var body: some View {
        ScrollView {
            VStack(spacing: 18) {
                
                VStack(alignment: .leading, spacing: 12) {
                    Text("Toggle Size")
                    Picker("Toggle Size", selection: $toggleSize) {
                        Text("SM").tag(SHDButtonSize.sm)
                        Text("MD").tag(SHDButtonSize.md)
                        Text("LG").tag(SHDButtonSize.lg)
                    }
                    .pickerStyle(.segmented)
                }
                .padding()
                
                VStack(alignment: .leading, spacing: 12) {
                    Text("Toggle Variant")
                    Picker("Toggle variant", selection: $toggleVariant) {
                        Text("Default").tag(SHDToggleVariant.default)
                        Text("Outline").tag(SHDToggleVariant.outline)
                    }
                    .pickerStyle(.segmented)
                }
                .padding()
                
                Toggle("Disabled", isOn: $disabled)
                    .padding()
                
                SHDToggle(
                    isActive: $isActive,
                    label: "Label + Icon",
                    icon: .arrowChevronDown
                )
                .toggleVariant(variant: toggleVariant, size: toggleSize)
                    .disabled(disabled)
                
                SHDToggle(
                    isActive: $isTextActive,
                    label: "Label only"
                )
                .toggleVariant(variant: toggleVariant, size: toggleSize)
                .disabled(disabled)
                
                SHDToggle(
                    isActive: $isIconActive,
                    icon: .arrowChevronDown
                )
                .toggleVariant(variant: toggleVariant, size: toggleSize)
                .disabled(disabled)
            }
        }
        .navigationTitle("SHDToggle")
    }
}

#Preview {
    SHDToggleDemoView()
}
