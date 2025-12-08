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

    @State private var selection = 0

    var body: some View {
        VStack(spacing: .sm) {
            TabView(selection: $selection) {
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
                        .fill(idx == selection ? SHDColor.foregroundDefault.color : SHDColor.foregroundDefault.color.opacity(0.3))
                        .frame(width: 8, height: 8)
                }
            }
        }
    }
}

#Preview {
    SHDCarouselPreview()
}
