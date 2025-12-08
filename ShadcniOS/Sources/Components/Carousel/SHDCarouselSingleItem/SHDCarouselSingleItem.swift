//
//  SHDCarouselSingleItem.swift
//  ShadcniOS
//
//  Created by JoseAlvarez on 12/8/25.
//

import SwiftUI

struct SHDCarouselSingleItem<Item, Content: View>: View {
    
    var layoutVariant: SHDCarouselLayoutVariant
    var proportionVariant: SHDCarouselProportionVariant
    var items: [Item]
    var content: (Item) -> Content

    var body: some View {

        let width = proportionVariant.width
        let height = proportionVariant.height

        TabView {
            ForEach(Array(items.enumerated()), id: \.offset) { index, item in
                content(item)
                    .horizontalFrameVariantion(
                        layoutVariant: layoutVariant,
                        proportionVariant: proportionVariant
                    )
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
        }
        .frame(width: width, height: height)
        .tabViewStyle(PageTabViewStyle())
    }
}
