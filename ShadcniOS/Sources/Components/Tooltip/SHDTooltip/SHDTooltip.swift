//
//  SHDTooltip.swift
//  ShadcniOS
//
//  Created by JoseAlvarez on 12/16/25.
//

import SwiftUI

struct SHDTooltip: View {
    var text: String

    var size: SHDTooltipSize = .md

    var body: some View {
        Text(text)
            .textStyle(size.textStyle)
            .padding(.vertical, .xxs)
            .padding(.horizontal, .sm)
            .overlay(
                RoundedRectangle(cornerRadius: .md).stroke(
                    SHDColor.borderDefault.color
                )
            )
            .foregroundColor(.foregroundDefault)
            .backgroundColor(.backgroundDefault)
            .shadowStyle(.md)
    }

    func tooltipStyle(_ size: SHDTooltipSize) -> Self {
        mutating(keyPath: \.size, value: size)
    }
}

#Preview {
    Spacer()

    SHDTooltip(text: "Hello World")
        .tooltipStyle(.sm)
Spacer()
    SHDTooltip(text: "Hello World")
    Spacer()

    SHDTooltip(text: "Hello World")
        .tooltipStyle(.lg)
    Spacer()
}
