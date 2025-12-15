//
//  SHDCarouselHorizontal.swift
//  ShadcniOS
//
//  Created by JoseAlvarez on 12/11/25.
//

import SwiftUI

/// An internal horizontal scroll container for displaying multiple carousel items side-by-side.
///
/// ## Discussion
///
/// `SHDCarouselHorizontal` renders carousel items in a horizontal `ScrollView` with multiple
/// items visible simultaneously. Items are arranged in an `HStack` with `.md` spacing and sized
/// based on the provided `proportionVariant`. This component is used for group horizontal layouts
/// where users can scroll through items horizontally to see adjacent content.
///
/// The component calculates item dimensions dynamically based on the container width:
/// - Item width: `containerWidth * proportionVariant.widthFactor`
/// - Item height: `itemWidth / proportionVariant.aspectRatio`
///
/// This ensures responsive sizing that adapts to different screen sizes while maintaining
/// the intended aspect ratios. The scroll view hides indicators and applies minimal padding
/// for a clean, focused browsing experience.
///
/// ## Parameters → Init
///
/// - `items`: An array of items to display in the horizontal group.
/// - `proportionVariant`: The `SHDCarouselProportionVariant` determining item dimensions and aspect ratios.
/// - `content`: A `@ViewBuilder` closure that takes an individual item and returns
///     the view to display for that item.
///
internal struct SHDCarouselHorizontal<Item, Content: View>: View {
    var items: [Item]
    var content: (Item) -> Content
    var layoutVariant: SHDCarouselLayoutVariant = .groupHorizonal
    var proportionVariant: SHDCarouselProportionVariant = .oneToOne

    var aspectRatio: CGFloat {
        proportionVariant.aspectRatio / proportionVariant.widthFactor
    }

    var body: some View {
        if proportionVariant == .sixteenToNine {
            SHDCarouselTabView(
                layoutVariant: layoutVariant,
                proportionVariant: proportionVariant,
                items: items,
                content: content
            )
            .singleProportionVariant(
                layoutVariant == .groupHorizonal
                    ? proportionVariant : .threeToFourWithSingleItem
            )
        } else {

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
                }
            }
            .aspectRatio(
                aspectRatio,
                contentMode: .fit
            )
            .padding(.vertical, .xxs)
            .padding(.horizontal, .sm)
        }
    }
}

#Preview {
    SHDCarouselPreview()
}
