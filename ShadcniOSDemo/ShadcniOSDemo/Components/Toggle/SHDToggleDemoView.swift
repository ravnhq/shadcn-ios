//
//  SHDToggleDemoView.swift
//  ShadcniOSDemo
//
//  Created by Diego Takaki on 12/26/25.
//

import SwiftUI
import ShadcniOS

struct SHDToggleDemoView: View {
    @State private var buttonSize: SHDButtonSize = .md
    @State private var toggleVariant: SHDButtonVariant = .ghost
    @State private var isActive: Bool = false
    @State private var disabled: Bool = false
    
    var body: some View {
        VStack(spacing: 18) {
            
            VStack(alignment: .leading, spacing: 12) {
                Text("Toggle Size")
                Picker("Toggle Size", selection: $buttonSize) {
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
                    Text("Default").tag(SHDButtonVariant.ghost)
                    Text("Outline").tag(SHDButtonVariant.outline)
                }
                .pickerStyle(.segmented)
            }
            .padding()
            
            Toggle("Disabled", isOn: $disabled)
                .padding()
            
            SHDToggle(isActive: $isActive, label: "Label", icon: .arrowChevronDown)
                .toggleVariant(variant: toggleVariant, size: buttonSize)
                .disabled(disabled)
        }
    }
}

#Preview {
    SHDToggleDemoView()
}
