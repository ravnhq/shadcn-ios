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
    let size: CheckboxSize

    func makeBody(configuration: Configuration) -> some View {
        HStack(alignment: .top, spacing: 8) {
            RoundedRectangle(cornerRadius: .sm)
                .foregroundColor(configuration.isOn ? .foregroundDefault : .clear)
                .overlay(
                    Image(systemName: configuration.isOn ? "checkmark" : "square")
                        .resizable()
                        .padding(.horizontal, 2)
                        .padding(.vertical, 4)
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

            VStack(alignment: .leading, spacing: 4) {
                configuration.label
                    .textStyle(size.textSize)
                    .font(.headline)
                    .foregroundColor(.foregroundDefault)

                if let description {
                    Text(description)
                        .textStyle(size.textSize)
                        .font(.caption)
                        .foregroundColor(.foregroundMuted)
                }
            }
        }
    }
}
