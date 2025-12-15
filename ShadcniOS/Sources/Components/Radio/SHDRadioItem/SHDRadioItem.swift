//
//  SHDRadioItem.swift
//  ShadcniOS
//
//  Created by JoseAlvarez on 12/15/25.
//

import SwiftUI

struct SHDRadioItem: View {
    var isFlagged: Bool
    var text: String?
    var size: SHDRadioGroupSize = .md
    var onTap: () -> Void

    var body: some View {
        Toggle(
            isOn: Binding(
                get: { isFlagged },
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

#Preview {
    struct PreviewWrapper: View {
        @State var isSelected = false
        
        var body: some View {
            SHDRadioItem(isFlagged: isSelected, text: "Opción de prueba") {
                isSelected.toggle()
            }
            .padding()
        }
    }
    
    return PreviewWrapper()
}
