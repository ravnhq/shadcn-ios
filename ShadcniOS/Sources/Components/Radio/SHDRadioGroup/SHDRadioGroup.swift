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
    private var textOption1: String
    private var textOption2: String
    private var textOption3: String

    init(
        selection: Binding<SHDRadioGroupSelection>,
        textOption1: String = "",
        textOption2: String = "",
        textOption3: String = ""
    ) {
        self._selection = selection
        self.textOption1 = textOption1
        self.textOption2 = textOption2
        self.textOption3 = textOption3
    }

    var body: some View {
        VStack {
            SHDRadioItem(
                isFlagged: selection == .firstOption,
                text: textOption1
            ) {
                selection = .firstOption
            }
            .radioItemStyle(size)

            SHDRadioItem(
                isFlagged: selection == .secondOption,
                text: textOption2
            ) {
                selection = .secondOption
            }
            .radioItemStyle(size)

            SHDRadioItem(
                isFlagged: selection == .thirdOption,
                text: textOption3
            ) {
                selection = .thirdOption
            }
            .radioItemStyle(size)
        }
    }

    func radioGroupStyle(_ size: SHDRadioGroupSize) -> Self {
        mutating(keyPath: \.size, value: size)
    }
}

struct SHDRadioGroupPreview: View {
    @State var selectionGroupMedium: SHDRadioGroupSelection = .thirdOption
    @State var selectionGroupLarge: SHDRadioGroupSelection = .thirdOption

    var body: some View {
        SHDRadioGroup(
            selection: $selectionGroupMedium,
            textOption1: "This is the first option",
            textOption2: "This is the second option",
            textOption3: "This is the third option"
        )
        .radioGroupStyle(.md)
        Divider()
        SHDRadioGroup(selection: $selectionGroupLarge)
            .radioGroupStyle(.lg)
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
