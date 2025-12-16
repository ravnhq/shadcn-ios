//
//  SHDRadioGroup.swift
//  ShadcniOS
//
//  Created by JoseAlvarez on 12/15/25.
//

import SwiftUI

public struct SHDRadioGroup: View {

    @Binding private var selection: SHDRadioGroupSelection
    private var size: SHDRadioGroupSize = .md
    private var textOption1: String
    private var textOption2: String
    private var textOption3: String
    private var disable: Bool = false

    public init(
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

    public var body: some View {
        VStack(spacing: .sm) {
            SHDRadioItem(
                isSelected: selection == .firstOption,
                text: textOption1
            ) {
                selection = .firstOption
            }
            .radioItemStyle(size)

            SHDRadioItem(
                isSelected: selection == .secondOption,
                text: textOption2
            ) {
                selection = .secondOption
            }
            .radioItemStyle(size)

            SHDRadioItem(
                isSelected: selection == .thirdOption,
                text: textOption3
            ) {
                selection = .thirdOption
            }
            .radioItemStyle(size)
        }
        .disabledMask()
        .disabled(disable)
    }

    public func radioGroupStyle(_ size: SHDRadioGroupSize) -> Self {
        mutating(keyPath: \.size, value: size)
    }

    public func disable(_ disable: Bool = true) -> Self {
        mutating(keyPath: \.disable, value: disable)
    }
}

#Preview {
    SHDRadioGroupPreview()
}
