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
        description: String? = nil,
        isChecked: Bool = false
    ) {
        self.label = label
        self.description = description
        _isChecked = State(initialValue: isChecked)
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
        checkboxStyle(size: size)
    }

    /// Applies checkbox sizing plus disabled opacity handling, similar to button variant modifiers.
    ///
    /// - Parameters:
    ///   - size: Desired checkbox size. Defaults to `.md`.
    ///   - isDisabled: Whether the checkbox should start disabled.
    ///   Applies reduced opacity and disables interaction.
    /// - Returns: A checkbox configured with the given size and disabled state.
    public func checkboxStyle(
        size: CheckboxSize = .md,
        isDisabled: Bool = false
    ) -> some View {
        mutating { checkbox in
            checkbox.size = size
        }
        .opacity(isDisabled ? 0.5 : 1.0)
        .disabled(isDisabled)
    }
}

// MARK: - Preview

#Preview {
    SHDCheckboxPreview()
}
