//
//  SHDCarouselItem.swift
//  ShadcniOS
//
//  Created by JoseAlvarez on 12/1/25.
//

import SwiftUI

struct SHDCarouselItem<Item, Content: View>: View {

    var layoutVariant: SHDCarouselLayoutVariant
    var proportionVariant: SHDCarouselProportionVariant
    var items: [Item]
    var content: (Item) -> Content

    var body: some View {
        ForEach(Array(items.enumerated()), id: \.offset) { _, item in
            content(item)
                .horizontalFrameVariantion(
                    layoutVariant: layoutVariant,
                    proportionVariant: proportionVariant
                )
        }
    }

    func proportionVariant(_ proportionVariant: SHDCarouselProportionVariant) -> Self {
        mutating(keyPath: \.proportionVariant, value: proportionVariant)
    }
}
