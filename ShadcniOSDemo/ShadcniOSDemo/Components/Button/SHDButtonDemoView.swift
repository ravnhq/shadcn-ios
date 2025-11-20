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
    @State private var variant: SHDVariantButton = .default
    @State private var iconSize: SHDIconSize = .md
    @State private var buttonSize: SHDSizeButton = .md
    @State private var style: SHDStyleButton = .buttonDefault

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

                configSection(title: "Icon Size") {
                    Picker("Icon Size", selection: $iconSize) {
                        Text("SM").tag(SHDIconSize.sm)
                        Text("MD").tag(SHDIconSize.md)
                        Text("LG").tag(SHDIconSize.lg)
                    }
                    .pickerStyle(.segmented)
                }

                configSection(title: "Button Size") {
                    Picker("Button Size", selection: $buttonSize) {
                        Text("SM").tag(SHDSizeButton.sm)
                        Text("MD").tag(SHDSizeButton.md)
                        Text("LG").tag(SHDSizeButton.lg)
                    }
                    .pickerStyle(.segmented)
                }

                HStack {
                    configSection(title: "Button Variant") {
                        Picker("Variant", selection: $variant) {
                            Text("Default").tag(SHDVariantButton.default)
                            Text("Secondary").tag(SHDVariantButton.secondary)
                            Text("Destructive").tag(SHDVariantButton.destructive)
                            Text("Outline").tag(SHDVariantButton.outline)
                            Text("Ghost").tag(SHDVariantButton.ghost)
                            Text("Link").tag(SHDVariantButton.link)
                        }
                    }
                    
                    Spacer()
                    
                    configSection(title: "Button Style") {
                        Picker("Style", selection: $style) {
                            Text("Default").tag(SHDStyleButton.buttonDefault)
                            Text("Loading").tag(SHDStyleButton.buttonLoading)
                            Text("Disabled").tag(SHDStyleButton.buttonDisable)
                        }
                    }
                }
                
                Divider()
                
                VStack(spacing: 16) {
                    Text("Preview")
                        .font(.headline)

                    demoButton
                        .padding(.top, 8)
                    
                    Text("Close button: ")
                    
                    SHDCloseButton()
                        .closeButtonError(.false)
                        
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
                .buttonLoading(style == .buttonLoading ? .buttonLoading : .buttonDefault)
                .iconSize(iconSize)
                .buttonVariant(variant)
                .shdButtonSize(buttonSize)
                .shdButtonStyle(style)

        case .labelOnly:
            SHDButton(label: "Button Example", action: {})
                .buttonVariant(variant)
                .shdButtonSize(buttonSize)
                .shdButtonStyle(style)

        case .both:
            SHDButton(
                label: "Button Example",
                icon: .notificationCheckCheck,
                action: {}
            )
            .iconSize(iconSize)
            .buttonVariant(variant)
            .shdButtonSize(buttonSize)
            .shdButtonStyle(style)
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
