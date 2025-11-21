//
//  SHDButtonDemoView.swift
//  ShadcniOSDemo
//
//  Created by JoseAlvarez on 11/18/25.
//

import SwiftUI
import ShadcniOS

// MARK: - Enums for UI selector
enum ContentType: String, CaseIterable {
    case iconOnly = "Icon Only"
    case labelOnly = "Label Only"
    case both = "Label + Icon"
}

// MARK: - Demo Button
struct SHDButtonDemoView: View {
    @State private var contentType: ContentType = .both
    @State private var variant: SHDButtonVariant = .default
    @State private var iconSize: SHDIconSize = .md
    @State private var buttonSize: SHDButtonSize = .md
    @State private var isLoading: Bool = false
    @State private var isDisabled: Bool = false

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 32) {

                // MARK: Selectors
                configSection(title: "Content Type") {
                    Picker("Content", selection: $contentType) {
                        ForEach(ContentType.allCases, id: \.self) {
                            Text($0.rawValue).tag($0)
                        }
                    }
                    .pickerStyle(.segmented)
                }

                configSection(title: "Button Size") {
                    Picker("Button Size", selection: $buttonSize) {
                        Text("SM").tag(SHDButtonSize.sm)
                        Text("MD").tag(SHDButtonSize.md)
                        Text("LG").tag(SHDButtonSize.lg)
                    }
                    .pickerStyle(.segmented)
                }

                HStack {
                    configSection(title: "Button Variant") {
                        Picker("Variant", selection: $variant) {
                            Text("Default").tag(SHDButtonVariant.default)
                            Text("Secondary").tag(SHDButtonVariant.secondary)
                            Text("Destructive").tag(SHDButtonVariant.destructive)
                            Text("Outline").tag(SHDButtonVariant.outline)
                            Text("Ghost").tag(SHDButtonVariant.ghost)
                            Text("Link").tag(SHDButtonVariant.link)
                        }
                    }
                    
                    Spacer()
                    
                    configSection(title: "Style") {
                        Toggle("Loading", isOn: $isLoading)
                        Toggle("Disabled", isOn: $isDisabled)
                    }
                    .scaleEffect(0.8)
                }
                
                Divider()
                
                VStack(spacing: 16) {
                    Text("Preview")
                        .font(.headline)

                    demoButton
                        .padding(.top, 8)
                    
                    Text("Close button: ")
                    
                    SHDCloseButton()
                        .errorStyle(false)
                        
                }
                .frame(maxWidth: .infinity, alignment: .center)
            }
            .padding()
        }
        .navigationTitle("SHDButton")
    }

    // MARK: - Button Preview
    @ViewBuilder
    private var demoButton: some View {
        switch contentType {

        case .iconOnly:
            SHDButton(icon: .notificationCheckCheck, action: {})
                .buttonVariant(variant: variant, size: buttonSize)
                .isLoading(isLoading)
                .disabled(isDisabled)

        case .labelOnly:
            SHDButton(label: "Button Example", action: {})
                .buttonVariant(variant: variant, size: buttonSize)
                .isLoading(isLoading)
                .disabled(isDisabled)

        case .both:
            SHDButton(
                label: "Button Example",
                icon: .notificationCheckCheck,
                action: {}
            )
            .buttonVariant(variant: variant, size: buttonSize)
            .isLoading(isLoading)
            .disabled(isDisabled)

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
    SHDButtonDemoView()
}
