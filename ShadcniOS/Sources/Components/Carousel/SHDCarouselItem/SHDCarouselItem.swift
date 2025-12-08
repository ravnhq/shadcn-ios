//
//  SHDCarouselItem.swift
//  ShadcniOS
//
//  Created by JoseAlvarez on 12/1/25.
//

import SwiftUI

struct SHDCarouselItem<Item, Content: View>: View {

    var layoutVariant: SHDCarouselLayoutVariant
    var proporcionVariant: SHDCarouselProportionVariant
    var visibleItems: [Item]
    var content: (Item) -> Content

    var body: some View {
        ForEach(Array(visibleItems.enumerated()), id: \.offset) { _, item in
            content(item)
                .horizontalFrameVariantion(
                    layoutVariant: layoutVariant,
                    proporcionVariant: proporcionVariant
                )
        }
    }

    func proportionVariant(_ proportionVariant: SHDCarouselProportionVariant) -> Self {
        mutating(keyPath: \.proporcionVariant, value: proportionVariant)
    }
}
