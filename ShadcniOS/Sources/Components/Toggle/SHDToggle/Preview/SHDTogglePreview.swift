//
//  SHDTogglePreview.swift
//  ShadcniOS
//
//  Created by Diego Takaki on 12/22/25.
//

import SwiftUI

struct SHDTogglePreview: View {
    @State private var isFullActive = false
    @State private var isFullActiveOutline = false
    @State private var isIconActive = false
    @State private var isIconActiveOutline = false
    @State private var isTextActive = false
    @State private var isTextActiveOutline = false

    var body: some View {
        VStack(spacing: 24) {
            Text("SHDToggle Examples")
                .font(.headline)

            VStack(alignment: .leading, spacing: 8) {
                Text("Icon + Text")
                    .font(.caption)
                    .foregroundColor(.secondary)

                HStack {
                    SHDToggle(
                        isActive: $isFullActive,
                        label: "Italic",
                        icon: .arrowChevronDown
                    )
                    .toggleVariant(variant: .default)

                    SHDToggle(
                        isActive: $isFullActiveOutline,
                        label: "Bold",
                        icon: .arrowChevronDown
                    )
                    .toggleVariant(variant: .outline)
                }
            }

            Divider()

            // Icon Only
            VStack(alignment: .leading, spacing: 8) {
                Text("Icon Only")
                    .font(.caption)
                    .foregroundColor(.secondary)

                HStack {
                    SHDToggle(
                        isActive: $isIconActive,
                        icon: .arrowChevronDown
                    )

                    SHDToggle(
                        isActive: $isIconActiveOutline,
                        icon: .arrowChevronDown
                    )
                    .toggleVariant(variant: .outline)
                }
            }

            Divider()

            // Text Only
            VStack(alignment: .leading, spacing: 8) {
                Text("Text Only")
                    .font(.caption)
                    .foregroundColor(.secondary)

                HStack {
                    SHDToggle(
                        isActive: $isTextActive,
                        label: "Italic"
                    )

                    SHDToggle(
                        isActive: $isTextActiveOutline,
                        label: "Bold"
                    )
                        .toggleVariant(variant: .outline)
                }
            }
        }
        .padding()
    }
}

#Preview {
    SHDTogglePreview()
}
