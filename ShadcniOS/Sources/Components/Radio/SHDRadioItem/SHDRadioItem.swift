//
//  SHDRadioItem.swift
//  ShadcniOS
//
//  Created by JoseAlvarez on 12/15/25.
//

import SwiftUI

struct SHDRadioItem: View {
    @State var isFlagged: Bool = false
    var text: String?

    var body: some View {
        Toggle(isOn: $isFlagged) {
            if let text {
                Text(text)
            }
        }
        .toggleStyle(ToggleRadioConfiguration())
    }
}

#Preview {
    SHDRadioItem()
}

