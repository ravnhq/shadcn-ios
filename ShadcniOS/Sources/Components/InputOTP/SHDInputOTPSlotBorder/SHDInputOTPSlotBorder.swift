//
//  SHDInputOTPSlotBorder.swift
//  ShadcniOS
//
//  Created by JoseAlvarez on 12/9/25.
//

import SwiftUI

struct SHDInputSlotBorder: View {
    let index: Int
    let count: Int
    let variant: SHDInputOTPVariant
    let isFocused: Bool
    
    private let cornerRadius: CGFloat = SHDSizing.Radius.md.value

    var body: some View {
        let isStart = variant.isStartOfGroup(index: index)
        let isEnd = variant.isEndOfGroup(index: index, totalCount: count)

        let shape = UnevenRoundedRectangle(
            topLeadingRadius: isStart ? cornerRadius : 0,
            bottomLeadingRadius: isStart ? cornerRadius : 0,
            bottomTrailingRadius: isEnd ? cornerRadius : 0,
            topTrailingRadius: isEnd ? cornerRadius : 0
        )

        ZStack {
            shape.fill(Color.white)
            
            shape.stroke(
                isFocused ? .black : .gray.opacity(0.5),
                lineWidth: isFocused ? 2 : 1
            )
        }
    }
}
