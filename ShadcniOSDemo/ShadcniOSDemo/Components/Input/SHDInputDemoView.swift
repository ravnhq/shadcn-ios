//
//  SHDInputDemoView.swift
//  ShadcniOSDemo
//
//  Created by Diego Takaki on 12/8/25.
//

import ShadcniOS
import SwiftUI

// MARK: - Enums for UI selector

enum InputExample: String, CaseIterable {
    case basic = "Basic"
    case withIcons = "With Icons"
    case withValidation = "With Validation"
    case obligatory = "Obligatory (Required)"
    case email = "Email Example"
    case password = "Password Example"
}

struct SHDInputDemoView: View {
    @State private var selectedExample: InputExample = .basic
    @State private var inputSize: SHDInputSize = .md
    @State private var inputVariant: SHDInputVariant = .default

    // Text states for different examples
    @State private var basicText: String = ""
    @State private var emailText: String = ""
    @State private var passwordText: String = ""
    @State private var usernameText: String = ""
    @State private var searchText: String = ""

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 32) {
                // MARK: Selectors

                configSection(title: "Example Type") {
                    Picker("Example", selection: $selectedExample) {
                        ForEach(InputExample.allCases, id: \.self) {
                            Text($0.rawValue).tag($0)
                        }
                    }
                    .pickerStyle(.menu)
                }

                configSection(title: "Input Size") {
                    Picker("Size", selection: $inputSize) {
                        Text("SM").tag(SHDInputSize.sm)
                        Text("MD").tag(SHDInputSize.md)
                        Text("LG").tag(SHDInputSize.lg)
                    }
                    .pickerStyle(.segmented)
                }

                configSection(title: "Input Variant") {
                    Picker("Variant", selection: $inputVariant) {
                        Text("Default").tag(SHDInputVariant.default)
                        Text("Obligatory").tag(SHDInputVariant.obligatory)
                    }
                    .pickerStyle(.segmented)
                }

                Divider()

                VStack(alignment: .leading, spacing: 16) {
                    Text("Preview")
                        .font(.headline)

                    demoInputs
                        .padding(.top, 8)
                }
            }
            .padding()
        }
        .navigationTitle("SHDInput")
    }

    // MARK: - Input Preview

    @ViewBuilder
    private var demoInputs: some View {
        switch selectedExample {
        case .basic:
            VStack(alignment: .leading, spacing: 20) {
                SHDInput(
                    text: $basicText,
                    label: "Username",
                    placeholder: "Enter your username"
                )
                .inputVariant(variant: inputVariant, size: inputSize)

                SHDInput(
                    text: $searchText,
                    label: "Search",
                    placeholder: "Type to search...",
                    caption: "Search across all fields"
                )
                .inputVariant(variant: inputVariant, size: inputSize)
            }

        case .withIcons:
            VStack(alignment: .leading, spacing: 20) {
                SHDInput(
                    text: $usernameText,
                    label: "Username",
                    leadingIcon: .notificationBellOff,
                    placeholder: "Enter username",
                    caption: "Choose a unique username"
                )
                .inputVariant(variant: inputVariant, size: inputSize)

                SHDInput(
                    text: $emailText,
                    label: "Email",
                    leadingIcon: .notificationBellRing,
                    trailingIcon: .notificationCheckCheck,
                    placeholder: "you@example.com",
                    caption: "We'll never share your email"
                )
                .inputVariant(variant: inputVariant, size: inputSize)
            }

        case .withValidation:
            VStack(alignment: .leading, spacing: 20) {
                SHDInput(
                    text: $usernameText,
                    label: "Username",
                    leadingIcon: .notificationCheck,
                    placeholder: "Enter username",
                    caption: "Must be at least 3 characters",
                    errorText: "Username is too short",
                    validation: { text in
                        text.count >= 3
                    }
                )
                .inputVariant(variant: inputVariant, size: inputSize)

                SHDInput(
                    text: $passwordText,
                    label: "Password",
                    leadingIcon: .notificationCheck,
                    placeholder: "Enter password",
                    caption: "Must be at least 8 characters",
                    errorText: "Password must be at least 8 characters",
                    validation: { text in
                        text.count >= 8
                    }
                )
                .inputVariant(variant: inputVariant, size: inputSize)
            }

        case .obligatory:
            VStack(alignment: .leading, spacing: 20) {
                SHDInput(
                    text: $usernameText,
                    label: "Full Name",
                    leadingIcon: .codingDevelopmentTerminal,
                    placeholder: "Enter your full name",
                    caption: "This field is required"
                )
                .inputVariant(variant: .obligatory, size: inputSize)

                SHDInput(
                    text: $emailText,
                    label: "Email Address",
                    leadingIcon: .mathsX,
                    placeholder: "you@example.com",
                    errorText: "Please provide your email address"
                )
                .inputVariant(variant: .obligatory, size: inputSize)
                .keyboardType(.emailAddress)
                .textInputAutocapitalization(.never)

                Text("Fields marked with * are required")
                    .font(.caption)
                    .foregroundStyle(.secondary)

                Text("Try tapping in and out of empty fields to see validation")
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }

        case .email:
            VStack(alignment: .leading, spacing: 20) {
                SHDInput(
                    text: $emailText,
                    label: "Email Address",
                    leadingIcon: .notificationCheck,
                    placeholder: "you@example.com",
                    caption: "Enter a valid email address",
                    errorText: "Please enter a valid email",
                    validation: { text in
                        text.contains("@") && text.contains(".")
                    }
                )
                .inputVariant(variant: inputVariant, size: inputSize)
                .keyboardType(.emailAddress)
                .textInputAutocapitalization(.never)
                .autocorrectionDisabled()

                Text("This example includes email validation")
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }

        case .password:
            VStack(alignment: .leading, spacing: 20) {
                SHDInput(
                    text: $passwordText,
                    label: "Password",
                    leadingIcon: .notificationCheck,
                    trailingIcon: .notificationBellOff,
                    placeholder: "Enter your password",
                    caption: "Must contain at least 8 characters",
                    errorText: "Password is too weak",
                    validation: { text in
                        text.count >= 8
                    }
                )
                .inputVariant(variant: inputVariant, size: inputSize)
                .textInputAutocapitalization(.never)
                .autocorrectionDisabled()

                Text("Trailing icon could be used for password visibility toggle")
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
        }
    }

    // MARK: - Helper Section Builder

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
    NavigationStack {
        SHDInputDemoView()
    }
}
