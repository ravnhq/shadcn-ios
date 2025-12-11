//
//  SHDCheckboxDemoView.swift
//  ShadcniOSDemo
//
//  Created by Concepción Orellana on 12/4/25.
//

import SwiftUI
import ShadcniOS

// MARK: - Demo Checkbox
struct SHDCheckboxDemoView: View {
    @State private var checkboxSize: CheckboxSize = .md
    @State private var isDisabled: Bool = false
    @State private var showDescription: Bool = true

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                configSection(title: "Checkbox Size") {
                    Picker("Checkbox Size", selection: $checkboxSize) {
                        Text("SM").tag(CheckboxSize.sm)
                        Text("MD").tag(CheckboxSize.md)
                        Text("LG").tag(CheckboxSize.lg)
                    }
                    .pickerStyle(.segmented)
                }

                configSection(title: "Options") {
                    Toggle("Show description", isOn: $showDescription)
                    Toggle("Disabled", isOn: $isDisabled)
                }
                .scaleEffect(0.9)

                Divider()

                VStack(alignment: .leading, spacing: 12) {
                    Text("Preview")
                        .font(.headline)

                    SHDCheckbox(
                        label: "Accept terms and conditions",
                        description: showDescription ? "You agree to our Terms of Service and Privacy Policy." : nil
                    )
                    .checkboxSize(checkboxSize)
                    .opacity(isDisabled ? 0.5 : 1)
                    .disabled(isDisabled)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding()
        }
        .navigationTitle("SHDCheckbox")
    }

    @ViewBuilder
    private func configSection<Content: View>(
        title: String,
        @ViewBuilder content: () -> Content
    ) -> some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(title)
                .font(.headline)
            content()
        }
    }
}

#Preview {
    SHDCheckboxDemoView()
}
