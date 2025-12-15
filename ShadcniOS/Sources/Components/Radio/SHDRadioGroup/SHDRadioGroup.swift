//
//  SHDRadioGroup.swift
//  ShadcniOS
//
//  Created by JoseAlvarez on 12/15/25.
//

import SwiftUI

struct SHDRadioGroup: View {

    @Binding private var selection: SHDRadioGroupSelection
    private var size: SHDRadioGroupSize = .md

    init(selection: Binding<SHDRadioGroupSelection>, size: SHDRadioGroupSize) {
        self._selection = selection
        self.size = size
    }

    var body: some View {
        VStack {
            SHDRadioItem(
                isFlagged: selection == .firstOption,
                text: "Option 1"
            ) {
                selection = .firstOption
            }
            .radioItemStyle(size)

            SHDRadioItem(
                isFlagged: selection == .secondOption,
                text: "Option 2"
            ) {
                selection = .secondOption
            }
            .radioItemStyle(size)

            SHDRadioItem(
                isFlagged: selection == .thirdOption,
                text: "Option 3"
            ) {
                selection = .thirdOption
            }
            .radioItemStyle(size)
        }
    }
}

struct SHDRadioGroupPreview: View {
    @State var selection: SHDRadioGroupSelection = .thirdOption

    var body: some View {
        SHDRadioGroup(selection: $selection, size: .md)
        Divider()
        SHDRadioGroup(selection: $selection, size: .lg)
    }
}

#Preview {
    SHDRadioGroupPreview()
}

enum SHDRadioGroupSelection {
    case firstOption
    case secondOption
    case thirdOption
}

enum SHDRadioGroupSize {
    case md
    case lg

    var outlineCircle: CGFloat {
        switch self {
        case .md: 20
        case .lg: 24
        }
    }

    var filledCircle: CGFloat {
        switch self {
        case .md: 14
        case .lg: 18
        }
    }

    var textStyle: SHDTextStyle {
        switch self {
        case .md: .textBaseMedium
        case .lg: .textLGMedium
        }
    }
}
