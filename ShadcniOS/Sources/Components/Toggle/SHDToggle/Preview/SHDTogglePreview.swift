//
//  SHDTogglePreview.swift
//  ShadcniOS
//
//  Created by Diego Takaki on 12/22/25.
//

import SwiftUI

struct SHDTogglePreview: View {
    @State private var isItalic = false
    @State private var isBold = false
    @State private var isBookmarked = false
    @State private var isFavorite = true

    var body: some View {
        VStack(spacing: 24) {
            Text("SHDToggle Examples")
                .font(.headline)

            // Icon + Text
            VStack(alignment: .leading, spacing: 8) {
                Text("Icon + Text")
                    .font(.caption)
                    .foregroundColor(.secondary)

                HStack {
                    SHDToggle(isActive: $isItalic, label: "Italic", icon: .arrowChevronDown)
                        .toggleVariant()

                    SHDToggle(isActive: $isBold, label: "Bold", icon: .arrowChevronDown)
                        .toggleVariant(variant: .ghost, activeVariant: .secondary)
                }
            }

            Divider()

            // Icon Only
            VStack(alignment: .leading, spacing: 8) {
                Text("Icon Only")
                    .font(.caption)
                    .foregroundColor(.secondary)

                HStack {
                    SHDToggle(isActive: $isBookmarked, icon: .arrowChevronDown)
                        .toggleVariant()

                    SHDToggle(isActive: $isFavorite, icon: .arrowChevronDown)
                        .toggleVariant(variant: .outline, activeVariant: .destructive, size: .lg)
                }
            }

            Divider()

            // Text Only
            VStack(alignment: .leading, spacing: 8) {
                Text("Text Only")
                    .font(.caption)
                    .foregroundColor(.secondary)

                HStack {
                    SHDToggle(isActive: $isItalic, label: "Italic")
                        .toggleVariant(size: .sm)

                    SHDToggle(isActive: $isBold, label: "Bold")
                        .toggleVariant()
                }
            }
        }
        .padding()
    }
}

#Preview {
    SHDTogglePreview()
}
