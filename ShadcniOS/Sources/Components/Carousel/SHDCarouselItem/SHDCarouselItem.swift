//
//  SHDCarouselItem.swift
//  ShadcniOS
//
//  Created by JoseAlvarez on 12/1/25.
//

import SwiftUI

struct SHDCarouselItem<Item, Content: View>: View {

    var layoutVariant: SHDCarouselLayoutVariant
    var proporcionVariant: SHDCarouselProprotionVariant
    var visibleItems: [Item]
    var content: (Item) -> Content

    var body: some View {
        ForEach(Array(visibleItems.enumerated()), id: \.offset) { _, item in
            content(item)
                .applyFrameIfHorizontal(
                    layoutVariant: layoutVariant,
                    proporcionVariant: proporcionVariant
                )
        }
    }

    func proportionVariant(_ proportionVariant: SHDCarouselProprotionVariant) -> Self {
        mutating(keyPath: \.proporcionVariant, value: proportionVariant)
    }
}

struct FrameModifier: ViewModifier {

    var layoutVariant: SHDCarouselLayoutVariant
    var proporcionVariant: SHDCarouselProprotionVariant

    func body(content: Content) -> some View {
        switch layoutVariant {
        case .groupVertical:
            return AnyView(content.frame(width: 398, height: 212))
        default:
            return AnyView(content.frame(width: proporcionVariant.width, height: proporcionVariant.height))
        }
    }
}

extension View {
    func applyFrameIfHorizontal(
        layoutVariant: SHDCarouselLayoutVariant,
        proporcionVariant: SHDCarouselProprotionVariant
    ) -> some View {
        modifier(
            FrameModifier(
                layoutVariant: layoutVariant,
                proporcionVariant: proporcionVariant
            )
        )
    }
}
