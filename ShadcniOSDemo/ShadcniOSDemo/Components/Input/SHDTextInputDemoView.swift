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
    @State private var hasInlineError: Bool = false
    @State private var isSecureField: Bool = false
    @State private var hasLabel: Bool = true
    @State private var hasCaption: Bool = true
    @FocusState private var isTextFieldFocused: Bool

    var textField: some View {
        SHDTextField(
            placeholder: isSecureField ? "Password" : "Email address",
            leadingIcon: hasLeadingIcon ? .notificationBellRing : nil,
            trailingIcon: hasTrailingIcon ? .mathsX : nil,
            text: $text
        )
        .inputStyle(size)
        .shdSecureField(isSecureField)
        .disabled(isDisabled)
        .focused($isTextFieldFocused)
        .onChange(of: text) {
            if hasInlineError {
                hasInlineError.toggle()
            }
        }
    }

    var body: some View {
        ScrollViewReader { proxy in
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
                .padding(.horizontal)

                configSection(title: "Options") {
                    Toggle("Leading icon", isOn: $hasLeadingIcon)

                    Toggle("Trailing icon", isOn: $hasTrailingIcon)
                        .disabled(isSecureField)

                    Toggle("Disabled", isOn: $isDisabled)

                    Toggle("Inline Error", isOn: $hasInlineError)

                    Toggle("Secure Field", isOn: $isSecureField)
                    
                    Toggle("Label", isOn: $hasLabel)
                    
                    Toggle("Caption", isOn: $hasCaption)
                }
                .scaleEffect(0.9)

                Divider()

                VStack(alignment: .leading, spacing: 24) {
                    Text("Preview")
                        .font(.headline)

                    // Conditional rendering based on label and caption toggles
                    if hasLabel || hasCaption {
                        SHDFormInput(
                            label: hasLabel ? "Email" : nil,
                            caption: hasCaption ? "We'll never share your email with anyone else." : nil
                        ) {
                            textField
                        }
                        .shdInlineError(hasInlineError ? "Error message" : nil)
                    } else {
                        // Without label or caption
                        textField
                            .shdInlineError(hasInlineError ? "Error message" : nil)
                    }
                }
                .padding()
                
                // Add extra spacing at the bottom to ensure full visibility
                Color.clear
                    .frame(height: 8)
            }
            .navigationTitle("SHDTextInput")
        }
        .onChange(of: isTextFieldFocused) { _, isFocused in
            if isFocused {
                // Scroll to the text field with animation when keyboard appears
                withAnimation {
                    proxy.scrollTo("textFieldContainer", anchor: .center)
                }
            }
        }
        .scrollDismissesKeyboard(.interactively)
        }
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
