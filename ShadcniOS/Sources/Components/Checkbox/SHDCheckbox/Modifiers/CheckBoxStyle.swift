//
//  CheckboxStyle.swift
//  ShadcniOS
//
//  Created by Concepción Orellana on 12/4/25.
//

import SwiftUI

/// Base checkbox toggle style used by the design system.
///
/// Mirrors the role of `BaseButtonStyle`, centralizing sizing and label styling so
/// `SHDCheckbox` stays lean.
internal struct CheckboxStyle: ToggleStyle {
    let description: String?
    let size: SHDCheckboxSize

    func makeBody(configuration: Configuration) -> some View {
        HStack(alignment: .top, spacing: .sm) {
            RoundedRectangle(cornerRadius: .sm)
                .foregroundColor(configuration.isOn ? .foregroundDefault : .clear)
                .overlay(
                    Image(systemName: configuration.isOn ? "checkmark" : "square")
                        .resizable()
                        .padding(.horizontal, .xxxxs)
                        .padding(.vertical, .xxxs)
                        .foregroundColor(configuration.isOn ? .foregroundPrimaryDefault : .clear)
                        .overlay(
                            RoundedRectangle(cornerRadius: .sm)
                                .stroke(
                                    .foregroundMuted,
                                    lineWidth: 2
                                )
                        )
                        .frame(width: size.rawValue, height: size.rawValue)
                )
                .frame(width: size.rawValue, height: size.rawValue)
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
    /// - Returns: A view with the ShadcniOS checkbox toggle style applied.
    func baseCheckboxStyle(description: String?, size: SHDCheckboxSize) -> some View {
        toggleStyle(CheckboxStyle(description: description, size: size))
    }
}
