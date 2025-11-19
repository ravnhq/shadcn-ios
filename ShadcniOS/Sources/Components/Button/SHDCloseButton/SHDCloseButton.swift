//
//  SHDCloseButton.swift
//  ShadcniOS
//
//  Created by JoseAlvarez on 11/19/25.
//

import SwiftUI

struct SHDCloseButton: View {

    @Environment(\.dismiss) var dismiss

    var body: some View {
        Button(action: { dismiss() }) {
            SHDIcon(.mathsX)
                .iconSize(.lg)
        }
    }
}

#Preview {
    SHDCloseButton()
        .closeButtonError(.false)
    
    SHDCloseButton()
        .closeButtonError(.true)
}
