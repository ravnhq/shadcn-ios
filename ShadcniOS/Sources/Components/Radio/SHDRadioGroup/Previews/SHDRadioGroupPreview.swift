//
//  SHDRadioGroupPreview.swift
//  ShadcniOS
//
//  Created by JoseAlvarez on 12/15/25.
//

import SwiftUI

internal struct SHDRadioGroupPreview: View {
    @State var selectecOption1: Int = 0
    @State var selectecOption2: Int = 0
    @State var selectecOption3: Int = 0

    var options: [String] = [
        "This is the 1st option",
        "This is the 2nd option",
        "This is the 3rd option"
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
                        selection: $selectecOption1,
                        options: options
                    )
                    .radioGroupStyle(.md)
                    .padding(.bottom, 10)
                }

                HStack {
                    Text("Large: ")
                    SHDRadioGroup(
                        selection: $selectecOption2,
                        options: options
                    )
                    .radioGroupStyle(.lg)
                }
            }
            .padding()

            VStack(alignment: .center, spacing: 15) {
                Text("Disable State:")
                    .textStyle(.textBaseSemibold)

                SHDRadioGroup(
                    selection: $selectecOption3,
                    options: options
                )
                .disable()
            }
            .padding(.horizontal, 90)
        }
    }
}

#Preview {
    SHDRadioGroupPreview()
}
