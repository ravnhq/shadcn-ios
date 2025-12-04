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

    // MARK: - Initializer

    /// Creates a ShadcniOS checkbox.
    ///
    /// - Parameters:
    ///   - label:
    ///   - description:
    public init(
        label: String,
        description: String? = nil
    ) {
        self.label = label
        self.description = description
    }

    public var body: some View {
        Toggle("Accept terms and conditions", isOn: $isChecked)
            .toggleStyle(CheckboxStyle(description: "You agree to our Terms of Service and Privacy Policy."))
            .padding()
    }
}

struct CheckboxStyle: ToggleStyle {
    let description: String?

    func makeBody(configuration: Configuration) -> some View {
        HStack(alignment: .top) {
            Image(systemName: configuration.isOn ? "checkmark.square" : "square")
                .resizable()
                .frame(width: 24, height: 24)
                .onTapGesture {
                    configuration.isOn.toggle()
                }

            VStack(alignment: .leading, spacing: 2) {
                configuration.label
                    .font(.headline)
                if let description {
                    Text(description)
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
