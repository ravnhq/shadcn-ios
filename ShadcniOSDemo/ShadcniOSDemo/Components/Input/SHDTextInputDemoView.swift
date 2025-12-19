//
//  SHDTextInputDemoView.swift
//  ShadcniOSDemo
//
//  Created by Concepción Orellana on 12/15/25.
//

import SwiftUI
import ShadcniOS

// MARK: - Demo Text Input
struct SHDTextInputDemoView: View {
    @State private var text: String = ""
    @State private var size: SHDInputSize = .md
    @State private var isDisabled: Bool = false
    @State private var hasLeadingIcon: Bool = true
    @State private var hasTrailingIcon: Bool = false

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                configSection(title: "Input Size") {
                    Picker("Input Size", selection: $size) {
                        Text("SM").tag(SHDInputSize.sm)
                        Text("MD").tag(SHDInputSize.md)
                        Text("LG").tag(SHDInputSize.lg)
                    }
                    .pickerStyle(.segmented)
                }

                configSection(title: "Options") {
                    Toggle("Leading icon", isOn: $hasLeadingIcon)
                    Toggle("Trailing icon", isOn: $hasTrailingIcon)
                    Toggle("Disabled", isOn: $isDisabled)
                }
                .scaleEffect(0.9)

                Divider()

                VStack(alignment: .leading, spacing: 12) {
                    Text("Preview")
                        .font(.headline)

                    SHDTextField(
                        text: $text,
                        placeholder: "Email address",
                        leadingIcon: hasLeadingIcon ? .notificationBellRing : nil,
                        trailingIcon: hasTrailingIcon ? .mathsX : nil
                    )
                    .inputStyle(size)
                    .disabled(isDisabled)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding()
        }
        .navigationTitle("SHDTextInput")
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
    SHDTextInputDemoView()
}
