//
//  SHDCheckbox.swift
//  ShadcniOS
//
//  Created by Concepción Orellana on 12/4/25.
//

import SwiftUI

public struct SHDCheckbox: View {
    @State private var isChecked = false

    private let label: String
    private let description: String?
    private let size: CheckboxSize

    // MARK: - Initializer

    /// Creates a ShadcniOS checkbox.
    ///
    /// - Parameters:
    ///   - label:
    ///   - description:
    public init(
        label: String,
        description: String? = nil,
        size: CheckboxSize = .md
    ) {
        self.label = label
        self.description = description
        self.size = size
    }

    public var body: some View {
        Toggle(label, isOn: $isChecked)
            .toggleStyle(CheckboxStyle(description: description, size: size))
            .padding()
    }
}

struct CheckboxStyle: ToggleStyle {
    let description: String?
    let size: CheckboxSize

    func makeBody(configuration: Configuration) -> some View {
        HStack(alignment: .top) {
            Image(systemName: configuration.isOn ? "checkmark.square" : "square")
                .resizable()
                .frame(width: size.rawValue, height: size.rawValue)
                .onTapGesture {
                    configuration.isOn.toggle()
                }

            VStack(alignment: .leading, spacing: 4) {
                configuration.label
                    .textStyle(size.textSize)
                    .font(.headline)

                if let description {
                    Text(description)
                        .textStyle(size.textSize)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
            }
        }
    }
}

// MARK: - Preview

#Preview {
    SHDCheckboxPreview()
}
