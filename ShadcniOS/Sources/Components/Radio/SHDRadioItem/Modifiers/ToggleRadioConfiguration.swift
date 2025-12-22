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
        HStack(spacing: .sm) {
            ZStack {
                Circle()
                    .strokeBorder(
                        SHDColor.borderPrimaryDefault.color,
                        lineWidth: 1
                    )
                    .frame(
                        width: size.outlineCircleSize,
                        height: size.outlineCircleSize
                    )

                if configuration.isOn {
                    Circle()
                        .fill(SHDColor.iconSecondaryDefault.color)
                        .frame(
                            width: size.filledCircleSize,
                            height: size.filledCircleSize
                        )
                }
            }
            .padding(.trailing, .xxs)

            configuration.label
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .onTapGesture {
            if !configuration.isOn {
                configuration.isOn = true
            }
        }
    }
}

extension View {
    /// Applies the ShadcniOS radio toggle style using the provided size.
    ///
    /// ## Discussion
    /// Mirrors other design-system helpers (such as `backgroundColor`) to keep styling
    /// centralized and readable. This attaches the custom `ToggleRadioConfiguration` style
    /// so the toggle renders with a circular radio indicator using the correct sizing tokens.
    ///
    /// ## Usage
    /// ```swift
    /// Toggle("Option 1", isOn: $isSelected)
    ///     .toggleRadioStyle(.md)
    /// ```
    ///
    /// - Parameters:
    ///   - size: Radio group sizing preset that controls both outline and filled circle dimensions.
    /// - Returns: A view with the radio toggle style applied.
    func toggleRadioStyle(_ size: SHDRadioGroupSize) -> some View {
        toggleStyle(ToggleRadioConfiguration(size: size))
    }
}
