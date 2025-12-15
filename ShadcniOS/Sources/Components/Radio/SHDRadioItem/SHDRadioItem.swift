//
//  SHDRadioItem.swift
//  ShadcniOS
//
//  Created by JoseAlvarez on 12/15/25.
//

import SwiftUI

struct SHDRadioItem: View {
    var isSelected: Bool
    var text: String?
    var size: SHDRadioGroupSize = .md
    var onTap: () -> Void

    var body: some View {
        Toggle(
            isOn: Binding(
                get: { isSelected },
                set: { newValue in
                    if newValue {
                        onTap()
                    }
                }
            )
        ) {
            if let text {
                Text(text)
                    .textStyle(size.textStyle)
            }
        }
        .toggleStyle(ToggleRadioConfiguration(size: size))
    }

    func radioItemStyle(_ size: SHDRadioGroupSize) -> Self {
        mutating(keyPath: \.size, value: size)
    }
}
