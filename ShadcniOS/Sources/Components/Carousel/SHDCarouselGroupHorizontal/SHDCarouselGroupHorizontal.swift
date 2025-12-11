//
//  SHDCarouselGroupHorizontal.swift
//  ShadcniOS
//
//  Created by JoseAlvarez on 12/11/25.
//

import SwiftUI

internal struct SHDCarouselGroupHorizontal<Item, Content: View>: View {
    var items: [Item]
    var proportionVariant: SHDCarouselProportionVariant
    var content: (Item) -> Content
    
    var body: some View {
        GeometryReader { proxy in
            let containerWidth = proxy.size.width
            let itemWidth = containerWidth * proportionVariant.widthFactor
            let itemHeight = itemWidth / proportionVariant.aspectRatio
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: .md) {
                    ForEach(Array(items.enumerated()), id: \.offset) { _, item in
                        content(item)
                            .frame(width: itemWidth, height: itemHeight)
                    }
                }
                .padding(.vertical, .xxs)
                .padding(.horizontal, .md)
            }
        }
        .aspectRatio(proportionVariant.aspectRatio / proportionVariant.widthFactor, contentMode: .fit)
    }
}
