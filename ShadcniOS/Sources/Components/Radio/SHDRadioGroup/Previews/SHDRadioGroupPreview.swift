//
//  SHDRadioGroupPreview.swift
//  ShadcniOS
//
//  Created by JoseAlvarez on 12/15/25.
//

import SwiftUI

internal struct RadioOptionPreview: SHDRadioGroupRepresentable {
    var title: String
}

internal struct SHDRadioGroupPreview: View {
    @State var selectecOption1: RadioOptionPreview?
    @State var selectecOption2: RadioOptionPreview?
    @State var selectecOption3: RadioOptionPreview?

    var items = [
        RadioOptionPreview(title: "This is the 1st option"),
        RadioOptionPreview(title: "This is the 2nd option"),
        RadioOptionPreview(title: "This is the 3th option")
    ]

    var body: some View {
        VStack(spacing: 20) {
            Text("Radio Group Variants")
                .textStyle(.text2XLSemibold)

            VStack(alignment: .center, spacing: 15) {
                Text("Sizes:")
                    .textStyle(.textBaseSemibold)

                HStack {
                    Text("Medium: ")

                    SHDRadioGroup(
                        items: items,
                        selection: $selectecOption1
                    )
                    .radioGroupStyle(.md)
                    .padding(.bottom, 10)
                }

                HStack {
                    Text("Large: ")
                    SHDRadioGroup(
                        items: items,
                        selection: $selectecOption2
                    )
                    .radioGroupStyle(.lg)
                }
            }
            .padding()

            VStack(alignment: .center, spacing: 15) {
                Text("Disable State:")
                    .textStyle(.textBaseSemibold)

                SHDRadioGroup(
                    items: items,
                    selection: $selectecOption3
                )
                .disabled(true)
            }
            .padding(.horizontal, 90)
        }
    }
}

#Preview {
    SHDRadioGroupPreview()
}
