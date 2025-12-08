//
//  SwiftUIView.swift
//  ShadcniOS
//
//  Created by Diego Takaki on 12/8/25.
//

import SwiftUI

public struct SHDInput: View {

    private var variant: SHDInputVariant = .default
    private var size: SHDInputSize = .md
    private var label: String
    private var leadingIcon: SHDIconAsset?
    private var placeholder: String?
    private var caption: String?
    @Binding var text: String
    @FocusState private var isFocused: Bool

    public init(text: Binding<String>,
                label: String,
                leadingIcon: SHDIconAsset? = nil,
                placeholder: String? = nil,
                caption: String? = nil) {
        _text = text
        self.label = label
        self.leadingIcon = leadingIcon
        self.placeholder = placeholder
        self.caption = caption
    }

    public var body: some View {
        VStack(alignment: .leading, spacing: .xs) {
            Text(label)
                .textStyle(size.textSize)
                .foregroundStyle(.foregroundDefault)

            HStack(spacing: .sm) {
                if let leadingIcon = leadingIcon {
                    SHDIcon(leadingIcon)
                }
                TextField(placeholder ?? "", text: $text)
                    .padding(.vertical, .sm)
                    .focused($isFocused)
            }
            .padding(.horizontal, .xs)
            .background(Color(.systemBackground))
            .overlay(
                RoundedRectangle(cornerRadius: 6)
                    .stroke(isFocused ? Color.red : Color(.separator), lineWidth: 1)
            )
            .contentShape(Rectangle())
            .onTapGesture {
                isFocused = true
            }

            if let caption = caption {
                Text(caption)
                    .textStyle(size.textSize)
                    .foregroundStyle(.foregroundMuted)
            }
        }
    }

    public func inputVariant(variant: SHDInputVariant, size: SHDInputSize) -> some View {
        mutating { button in
            button.variant = variant
            button.size = size
        }
    }
}

#Preview {
    SHDInputPreview()
}
