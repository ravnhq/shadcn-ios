//
//  SHDCheckbox.swift
//  ShadcniOS
//
//  Created by Concepción Orellana on 12/4/25.
//

import SwiftUI

/// A configurable checkbox used throughout the ShadcniOS design system.
///
/// ## Discussion
/// `SHDCheckbox` pairs a toggle with label/description text and design-token driven
/// typography. Visual styling (size, disabled opacity) is applied through the
/// provided modifiers, keeping the core component focused on layout.
///
/// - Sizing is controlled by ``checkboxStyle(size:)``,
/// which updates control and typography dimensions.
/// - Checked state is controlled externally via `Binding<Bool>`.
///
/// Creates a ShadcniOS checkbox.
///
/// - Parameters:
///   - label: Leading label text.
///   - isChecked: Bound state for the toggle.
///   - description: Optional supporting text shown below the label.
///
/// ## Usage
/// Basic checkbox:
/// ```swift
/// @State private var isChecked = false
/// SHDCheckbox(label: "Accept terms", isChecked: $isChecked)
///     .checkboxStyle(size: .md)
/// ```
///
/// Disabled and pre-checked:
/// ```swift
/// @State private var isChecked = true
/// SHDCheckbox(label: "Accept terms", isChecked: $isChecked)
///     .checkboxStyle(size: .md)
/// ```
public struct SHDCheckbox: View {
    @Binding private var isChecked: Bool

    private let description: String?
    private let label: String
    private var size: SHDCheckboxSize = .md

    // MARK: - Initializer

    public init(
        label: String,
        isChecked: Binding<Bool>,
        description: String? = nil
    ) {
        self.description = description
        self.label = label
        _isChecked = isChecked
    }

    public var body: some View {
        Toggle(label, isOn: $isChecked)
            .baseCheckboxStyle(description: description, size: size)
            .disabledMask()
    }

    /// Applies checkbox sizing, similar to button size modifiers.
    ///
    /// ## Usage
    /// ```swift
    /// SHDCheckbox(label: "Accept terms")
    ///     .checkboxStyle(size: .md)
    /// ```
    ///
    /// - Parameters:
    ///   - size: Desired checkbox size. Defaults to `.md`.
    public func checkboxStyle(
        size: SHDCheckboxSize = .md
    ) -> some View {
        mutating { checkbox in
            checkbox.size = size
        }
    }
}

// MARK: - Preview

#Preview {
    SHDCheckboxPreview()
}
