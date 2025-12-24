//
//  SHDInputSlotBorder.swift
//  ShadcniOS
//
//  Created by Samuel Cornejo on 2025-12-24.
//

import SwiftUI

struct SHDInputSlotBorder: ViewModifier {
    // MARK: Properties

    @FocusState private var isFocused: Bool

    private var borderColor: SHDColor {
        if isFocused {
            .borderPrimaryDefault
        } else if isError {
            .borderDestructiveDefault
        } else {
            .borderDefault
        }
    }

    let isInitialField: Bool
    let isFinalField: Bool
    let isError: Bool

    func body(content: Content) -> some View {
        content
            .focused($isFocused)
            .zIndex(isFocused ? 1 : 0)
            .background {
                UnevenRoundedRectangle(
                    topLeadingRadius: calculateRadius(isInitialField),
                    bottomLeadingRadius: calculateRadius(isInitialField),
                    bottomTrailingRadius: calculateRadius(isFinalField),
                    topTrailingRadius: calculateRadius(isFinalField)
                )
                .fill(.white)
                .stroke(borderColor.color, lineWidth: isFocused ? 2 : 1)
            }
    }

    // MARK: Private Methods

    private func calculateRadius(_ shouldBend: Bool) -> CGFloat {
        shouldBend ? SHDSizing.Radius.md.value : 0
    }
}

extension View {
    func border(isInitialField: Bool, isFinalField: Bool, isError: Bool) -> some View {
        modifier(
            SHDInputSlotBorder(
                isInitialField: isInitialField,
                isFinalField: isFinalField,
                isError: isError
            )
        )
    }
}
