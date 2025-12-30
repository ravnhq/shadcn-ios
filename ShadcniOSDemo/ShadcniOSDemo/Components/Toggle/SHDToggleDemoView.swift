//
//  SHDToggleDemoView.swift
//  ShadcniOSDemo
//
//  Created by Diego Takaki on 12/26/25.
//

import ShadcniOS
import SwiftUI

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
                    icon: .arrowChevronDown,
                    label: "Label + Icon",
                    isActive: $isActive
                )
                .toggleVariant(variant: toggleVariant, size: toggleSize)
                .disabled(disabled)

                SHDToggle(
                    label: "Label only",
                    isActive: $isTextActive
                )
                .toggleVariant(variant: toggleVariant, size: toggleSize)
                .disabled(disabled)

                SHDToggle(
                    icon: .arrowChevronDown,
                    isActive: $isIconActive
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
