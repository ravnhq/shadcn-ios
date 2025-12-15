//
//  ToggleRadioConfiguration.swift
//  ShadcniOS
//
//  Created by JoseAlvarez on 12/15/25.
//

import SwiftUI

struct ToggleRadioConfiguration: ToggleStyle {
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
                        .transition(.scale.animation(.easeInOut(duration: 0.1)))
                }
            }
            configuration.label
                .padding(.leading, 8)
        }
        .contentShape(Rectangle())
        .onTapGesture {
            if !configuration.isOn {
                configuration.isOn = true
            }
        }
    }
}
