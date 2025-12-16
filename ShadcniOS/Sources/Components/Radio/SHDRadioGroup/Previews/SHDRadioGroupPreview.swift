//
//  SHDRadioGroupPreview.swift
//  ShadcniOS
//
//  Created by JoseAlvarez on 12/15/25.
//

import SwiftUI

internal struct SHDRadioGroupPreview: View {
    @State var selectionGroupMedium: SHDRadioGroupSelection = .thirdOption
    @State var selectionGroupLarge: SHDRadioGroupSelection = .thirdOption
    @State var selectionGroupDisabled: SHDRadioGroupSelection = .thirdOption

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
                        selection: $selectionGroupMedium,
                        textOption1: "This is the 1st option",
                        textOption2: "This is the 2nd option",
                        textOption3: "This is the 3rd option"
                    )
                    .radioGroupStyle(.md)
                    .padding(.bottom, 10)
                }

                HStack {
                    Text("Large: ")
                    SHDRadioGroup(
                        selection: $selectionGroupLarge,
                        textOption1: "This is the 1st option",
                        textOption2: "This is the 2nd option",
                        textOption3: "This is the 3rd option"
                    )
                    .radioGroupStyle(.lg)
                }
            }
            .padding()

            VStack(alignment: .center, spacing: 15) {
                Text("Disable State:")
                    .textStyle(.textBaseSemibold)

                SHDRadioGroup(
                    selection: $selectionGroupDisabled,
                    textOption1: "This is the 1st option",
                    textOption2: "This is the 2nd option",
                    textOption3: "This is the 3rd option"
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
