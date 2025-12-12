//
//  CheckboxStyle.swift
//  ShadcniOS
//
//  Created by Concepción Orellana on 12/4/25.
//

import SwiftUI

/// Checkbox toggle style that encapsulates the visual language for the component.
///
/// Centralizes the square, checkmark, border, and typography treatment so `SHDCheckbox`
/// only handles content and state. Applies design-token spacing, sizing, and colors for
/// the control, label, and optional description.
internal struct CheckboxStyle: ToggleStyle {
    let description: String?
    let size: SHDCheckboxSize

    func makeBody(configuration: Configuration) -> some View {
        HStack(alignment: .top, spacing: .sm) {
            RoundedRectangle(cornerRadius: .sm)
                .foregroundColor(configuration.isOn ? .foregroundDefault : .clear)
                .frame(width: size.rawValue, height: size.rawValue)
                .overlay(
                    SHDIcon(.notificationCheck)
                        .iconSize(size.iconSize)
                        .foregroundColor(configuration.isOn ? .foregroundPrimaryDefault : .clear)
                        .overlay(
                            RoundedRectangle(cornerRadius: .sm)
                                .inset(by: 1)
                                .stroke(
                                    .foregroundMuted,
                                    lineWidth: 2
                                )
                        )
                )
                .onTapGesture {
                    configuration.isOn.toggle()
                }

            VStack(alignment: .leading, spacing: .xs) {
                configuration.label
                    .textStyle(size.labelTextStyle)
                    .foregroundColor(.foregroundDefault)

                if let description {
                    Text(description)
                        .textStyle(size.descriptionTextSize)
                        .foregroundColor(.foregroundMuted)
                }
            }
        }
    }
}

internal extension View {
    /// Applies the ShadcniOS checkbox style using the provided description and size.
    ///
    /// ## Discussion
    /// Mirrors other design-system helpers (such as `backgroundColor`) to keep styling
    /// centralized and readable. This attaches the custom `CheckboxStyle` so the control,
    /// label, and optional description render with the correct sizing and typography tokens.
    ///
    /// ## Usage
    /// ```swift
    /// SHDCheckbox(label: "Accept terms")
    ///     .baseCheckboxStyle(description: "You agree to the policy.", size: .md)
    /// ```
    ///
    /// - Parameters:
    ///   - description: Optional supporting text displayed under the label.
    ///   - size: Checkbox sizing preset that controls both square and text dimensions.
    func baseCheckboxStyle(description: String?, size: SHDCheckboxSize) -> some View {
        toggleStyle(CheckboxStyle(description: description, size: size))
    }
}
