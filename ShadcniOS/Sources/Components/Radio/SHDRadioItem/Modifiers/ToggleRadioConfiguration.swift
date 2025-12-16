//
//  ToggleRadioConfiguration.swift
//  ShadcniOS
//
//  Created by JoseAlvarez on 12/15/25.
//

import SwiftUI

/// A toggle style that renders a circular radio indicator.
///
/// ## Discussion
/// `ToggleRadioConfiguration` is responsible for drawing the outer and inner
/// circles used by radio items and wiring tap gestures so the control behaves
/// like a single-select radio option.
///
/// Sizing is driven by ``SHDRadioGroupSize``:
/// - `outlineCircle` defines the outer ring diameter.
/// - `filledCircle` defines the inner filled circle when selected.
///
/// This style is applied internally by ``SHDRadioItem`` and is not intended
/// for direct use outside the radio component stack.
internal struct ToggleRadioConfiguration: ToggleStyle {
    var size: SHDRadioGroupSize = .md

    func makeBody(configuration: Configuration) -> some View {
        HStack {
            ZStack {
                Circle()
                    .strokeBorder(SHDColor.borderPrimaryDefault.color, lineWidth: 1)
                    .frame(width: size.outlineCircle, height: size.outlineCircle)

                if configuration.isOn {
                    Circle()
                        .fill(SHDColor.iconSecondaryDefault.color)
                        .frame(width: size.filledCircle, height: size.filledCircle)
                }
            }
            .padding(.trailing, .xxs)
            configuration.label
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .contentShape(Rectangle())
        .onTapGesture {
            if !configuration.isOn {
                configuration.isOn = true
            }
        }
    }
}
