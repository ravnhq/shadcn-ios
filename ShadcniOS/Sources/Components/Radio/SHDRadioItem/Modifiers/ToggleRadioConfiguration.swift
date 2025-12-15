//
//  ToggleRadioConfiguration.swift
//  ShadcniOS
//
//  Created by JoseAlvarez on 12/15/25.
//

import SwiftUI

struct ToggleRadioConfiguration: ToggleStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        HStack {
            ZStack {
                Circle()
                    .strokeBorder(SHDColor.borderPrimaryDefault.color, lineWidth: 1)
                    .frame(width: 20, height: 20)

                if configuration.isOn {
                    Circle()
                        .fill(SHDColor.iconSecondaryDefault.color)
                        .frame(width: 14, height: 14)
                        .padding(3)
                }
            }
            .onTapGesture {
                configuration.isOn.toggle()
            }

            configuration.label
        }
    }
}
