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
    private var size: CheckboxSize = .md

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
        Toggle(label, isOn: $isChecked)
            .baseCheckboxStyle(description: description, size: size)
            .padding()
    }

    /// Applies the checkbox size using a modifier-style API.
    ///
    /// - Parameter size: Desired checkbox sizing preset.
    /// - Returns: A checkbox with the updated size.
    public func checkboxSize(_ size: CheckboxSize) -> some View {
        mutating { checkbox in
            checkbox.size = size
        }
    }
}

// MARK: - Preview

#Preview {
    SHDCheckboxPreview()
}
