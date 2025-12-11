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
/// - Disabled state can be applied with ``checkboxDisabled(_:)`` (or plain `.disabled`).
/// - The initial checked state can be set through the initializer.
///
/// Creates a ShadcniOS checkbox.
///
/// - Parameters:
///   - label: Leading label text.
///   - description: Optional supporting text shown below the label.
///   - isChecked: Optional initial toggle state.
///
/// ## Usage
/// Basic checkbox:
/// ```swift
/// SHDCheckbox(label: "Accept terms")
///     .checkboxStyle(size: .md)
/// ```
///
/// Disabled and pre-checked:
/// ```swift
/// SHDCheckbox(label: "Accept terms", isChecked: true)
///     .checkboxStyle(size: .md)
///     .checkboxDisabled(true)
/// ```
public struct SHDCheckbox: View {
    @State private var isChecked = false

    private let label: String
    private let description: String?
    private var size: SHDCheckboxSize = .md
    private var isDisabled: Bool = false

    // MARK: - Initializer

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
            .disabledMask()
    }

    /// Applies checkbox sizing.
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

    public func isDisabled(_ isDisabled: Bool = false) -> some View {
        mutating { checkbox in
            checkbox.isDisabled = isDisabled
        }
    }
}

// MARK: - Preview

#Preview {
    SHDCheckboxPreview()
}
