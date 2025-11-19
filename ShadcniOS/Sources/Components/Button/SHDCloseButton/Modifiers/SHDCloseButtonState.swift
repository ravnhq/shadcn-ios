//
//  SHDCloseButtonState.swift
//  ShadcniOS
//
//  Created by JoseAlvarez on 11/19/25.
//

import SwiftUI

struct SHDCloseButtonState: ButtonStyle {

    let state: StateCloseButton

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(state.foregroundColor)
    }
}

extension View {
    func closeButtonError(_ state: StateCloseButton) -> some View {
        buttonStyle(SHDCloseButtonState(state: state))
    }
}
