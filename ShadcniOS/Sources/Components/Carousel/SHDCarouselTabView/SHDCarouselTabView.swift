//
//  SHDCarouselTabView.swift
//  ShadcniOS
//
//  Created by JoseAlvarez on 12/8/25.
//

import SwiftUI

struct SHDCarouselTabView<Item, Content: View>: View {

    var layoutVariant: SHDCarouselLayoutVariant
    var proportionVariant: SHDCarouselProportionVariant
    var items: [Item]
    var content: (Item) -> Content

    @State private var currentPage = 0

    var body: some View {
        VStack(spacing: .sm) {
            TabView(selection: $currentPage) {
                ForEach(Array(items.enumerated()), id: \.offset) { index, item in
                    content(item)
                        .horizontalFrameVariantion(
                            layoutVariant: layoutVariant,
                            proportionVariant: proportionVariant
                        )
                        .tag(index)
                }
            }
            .frame(width: proportionVariant.width, height: proportionVariant.height)
            .tabViewStyle(.page(indexDisplayMode: .never))

            HStack(spacing: 8) {
                ForEach(0..<items.count, id: \.self) { idx in
                    Circle()
                        .fill(idx == currentPage
                              ? SHDColor.foregroundDefault.color
                              : SHDColor.foregroundDefault.color.opacity(0.3))
                        .frame(width: 8, height: 8)
                }
            }
        }
    }
    
    func singleProportionVariant(_ proportionVariant: SHDCarouselProportionVariant) -> Self {
        mutating(keyPath: \.proportionVariant, value: proportionVariant)
    }
}

#Preview {
    SHDCarouselPreview()
}
