//
//  SHDCarousel.swift
//  ShadcniOS
//
//  Created by JoseAlvarez on 12/1/25.
//

import SwiftUI

struct SHDCarousel<Item, Content: View>: View {

    @State private var index = 0

    private var items: [Item]
    private var content: (Item) -> Content

    private var layoutVariant: SHDCarouselLayoutVariant = .groupHorizonal
    private var proportionVariant: SHDCarouselProportionVariant = .oneToOne

    private var carouselContent: some View {
        SHDCarouselItem(
            layoutVariant: layoutVariant,
            proportionVariant: proportionVariant,
            items: items,
            content: content
        )
    }

    private var carouselPagedContent: some View {
        SHDCarouselTabView(
            layoutVariant: layoutVariant,
            proportionVariant: proportionVariant,
            items: items,
            content: content
        )
    }

    init(
        items: [Item],
        @ViewBuilder content: @escaping (Item) -> Content
    ) {
        self.items = items
        self.content = content
    }

    var body: some View {
        Group {
            switch layoutVariant {
            case .groupHorizonal:
                if proportionVariant == .sixteenToNine {
                    carouselPagedContent
                        .padding(.vertical, .xxs)
                        .padding(.horizontal, .md)
                } else {
                    ScrollView(.horizontal) {
                        HStack(spacing: .md) {
                            carouselContent
                        }
                        .padding(.vertical, .xxs)
                        .padding(.horizontal, .md)
                    }
                }

            case .singleHorizonal:
                carouselPagedContent
                    .padding(.vertical, .xxs)
                    .padding(.horizontal, .md)

            case .groupVertical:
                ScrollView {
                    VStack {
                        carouselContent
                    }
                    .padding(.vertical, .xxs)
                    .padding(.horizontal, .md)

                }
            }
        }
    }

    func carouselLayoutVariant(_ layoutVariant: SHDCarouselLayoutVariant) -> Self {
        mutating(keyPath: \.layoutVariant, value: layoutVariant)
    }

    func carouselProportionVariant(
        _ proportionVariant: SHDCarouselProportionVariant
    ) -> Self {
        mutating(keyPath: \.proportionVariant, value: proportionVariant)
    }
}

#Preview {
    SHDCarouselPreview()
}
