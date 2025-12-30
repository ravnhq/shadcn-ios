//
//  SHDInputPreview.swift
//  ShadcniOSDemo
//
//  Created by Concepción Orellana on 12/30/25.
//

import SwiftUI
import ShadcniOS

/// A comprehensive preview showcasing various `SHDTextField` configurations
/// with and without labels, captions, and different states.
struct SHDInputPreview: View {
    @State private var emailText: String = ""
    @State private var passwordText: String = ""
    @State private var usernameText: String = ""
    @State private var searchText: String = ""
    @State private var errorText: String = ""
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 32) {
                // MARK: - Without Label & Caption
                sectionHeader(title: "Without Label & Caption")
                
                VStack(alignment: .leading, spacing: 16) {
                    // Basic input
                    SHDTextField(
                        placeholder: "Enter your email",
                        text: $emailText
                    )
                    .inputStyle(.md)
                    
                    // With leading icon
                    SHDTextField(
                        placeholder: "Search...",
                        leadingIcon: .search,
                        text: $searchText
                    )
                    .inputStyle(.md)
                    
                    // With trailing icon
                    SHDTextField(
                        placeholder: "Enter username",
                        trailingIcon: .user,
                        text: $usernameText
                    )
                    .inputStyle(.md)
                    
                    // Secure field
                    SHDTextField(
                        placeholder: "Password",
                        text: $passwordText
                    )
                    .inputStyle(.md)
                    .shdSecureField(true)
                }
                .padding(.horizontal)
                
                Divider()
                    .padding(.horizontal)
                
                // MARK: - With Label & Caption
                sectionHeader(title: "With Label & Caption")
                
                VStack(alignment: .leading, spacing: 16) {
                    // Standard form input
                    SHDFormInput(
                        label: "Email",
                        caption: "We'll never share your email."
                    ) {
                        SHDTextField(
                            placeholder: "email@example.com",
                            leadingIcon: .user,
                            text: $emailText
                        )
                        .inputStyle(.md)
                    }
                    
                    // Password with label
                    SHDFormInput(
                        label: "Password",
                        caption: "Must be at least 8 characters."
                    ) {
                        SHDTextField(
                            placeholder: "Enter your password",
                            text: $passwordText
                        )
                        .inputStyle(.md)
                        .shdSecureField(true)
                    }
                    
                    // Username with label
                    SHDFormInput(
                        label: "Username",
                        caption: "This will be your public display name."
                    ) {
                        SHDTextField(
                            placeholder: "@username",
                            leadingIcon: .user,
                            text: $usernameText
                        )
                        .inputStyle(.md)
                    }
                }
                .padding(.horizontal)
                
                Divider()
                    .padding(.horizontal)
                
                // MARK: - Different Sizes
                sectionHeader(title: "Size Variants")
                
                VStack(alignment: .leading, spacing: 16) {
                    SHDFormInput(
                        label: "Small",
                        caption: "Small size input"
                    ) {
                        SHDTextField(
                            placeholder: "Small input",
                            text: $emailText
                        )
                        .inputStyle(.sm)
                    }
                    
                    SHDFormInput(
                        label: "Medium",
                        caption: "Medium size input (default)"
                    ) {
                        SHDTextField(
                            placeholder: "Medium input",
                            text: $emailText
                        )
                        .inputStyle(.md)
                    }
                    
                    SHDFormInput(
                        label: "Large",
                        caption: "Large size input"
                    ) {
                        SHDTextField(
                            placeholder: "Large input",
                            text: $emailText
                        )
                        .inputStyle(.lg)
                    }
                }
                .padding(.horizontal)
                
                Divider()
                    .padding(.horizontal)
                
                // MARK: - States
                sectionHeader(title: "States")
                
                VStack(alignment: .leading, spacing: 16) {
                    // Disabled state
                    SHDFormInput(
                        label: "Disabled",
                        caption: "This input is disabled"
                    ) {
                        SHDTextField(
                            placeholder: "Disabled input",
                            text: .constant("Cannot edit")
                        )
                        .inputStyle(.md)
                        .disabled(true)
                    }
                    
                    // Error state
                    SHDFormInput(
                        label: "Email with Error",
                        caption: "This shows an error state"
                    ) {
                        SHDTextField(
                            placeholder: "email@example.com",
                            leadingIcon: .user,
                            text: $errorText
                        )
                        .inputStyle(.md)
                        .shdInlineError("Please enter a valid email address")
                    }
                }
                .padding(.horizontal)
                
                Divider()
                    .padding(.horizontal)
                
                // MARK: - Only Label (No Caption)
                sectionHeader(title: "Only Label (No Caption)")
                
                VStack(alignment: .leading, spacing: 16) {
                    SHDFormInput(label: "Email") {
                        SHDTextField(
                            placeholder: "email@example.com",
                            text: $emailText
                        )
                        .inputStyle(.md)
                    }
                    
                    SHDFormInput(label: "Username") {
                        SHDTextField(
                            placeholder: "Enter username",
                            leadingIcon: .user,
                            text: $usernameText
                        )
                        .inputStyle(.md)
                    }
                }
                .padding(.horizontal)
                
                Divider()
                    .padding(.horizontal)
                
                // MARK: - Only Caption (No Label)
                sectionHeader(title: "Only Caption (No Label)")
                
                VStack(alignment: .leading, spacing: 16) {
                    SHDFormInput(caption: "Enter your email address") {
                        SHDTextField(
                            placeholder: "email@example.com",
                            text: $emailText
                        )
                        .inputStyle(.md)
                    }
                    
                    SHDFormInput(caption: "Search through all items") {
                        SHDTextField(
                            placeholder: "Search...",
                            leadingIcon: .search,
                            text: $searchText
                        )
                        .inputStyle(.md)
                    }
                }
                .padding(.horizontal)
                
                // Bottom padding
                Color.clear
                    .frame(height: 8)
            }
            .padding(.vertical)
        }
        .navigationTitle("Input Examples")
        .scrollDismissesKeyboard(.interactively)
    }
    
    @ViewBuilder
    private func sectionHeader(title: String) -> some View {
        Text(title)
            .font(.title3)
            .fontWeight(.semibold)
            .padding(.horizontal)
    }
}

#Preview {
    NavigationStack {
        SHDInputPreview()
    }
}
