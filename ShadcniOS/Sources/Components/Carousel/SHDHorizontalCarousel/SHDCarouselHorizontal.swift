//
//  SHDHorizontalCarousel.swift
//  ShadcniOS
//
//  Created by JoseAlvarez on 12/11/25.
//

import SwiftUI

/// An internal horizontal scroll container for displaying multiple carousel items side-by-side.
///
/// ## Discussion
///
/// `SHDHorizontalCarousel` renders carousel items in a horizontal `ScrollView` with multiple
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
/// - `proportionVariant`: The `SHDCarouseItemAspectRatio` determining item dimensions and aspect ratios.
/// - `content`: A `@ViewBuilder` closure that takes an individual item and returns
///     the view to display for that item.
///
internal struct SHDHorizontalCarousel<Item, Content: View>: View {
    var items: [Item]
    var modelItemView: (Item) -> Content
    var layoutVariant: SHDCarouselLayout = .groupHorizonal(.oneToOne)

    var proportionVariant: SHDCarouseItemAspectRatio {
        layoutVariant.resolvedProportionVariant
    }

    var aspectRatio: CGFloat {
        proportionVariant.aspectRatio / proportionVariant.widthFactor
    }

    var body: some View {
        if proportionVariant == .sixteenToNine {
            SHDCarouselTabView(
                layoutVariant: layoutVariant,
                proportionVariant: proportionVariant,
                items: items,
                modelItemView: modelItemView
            )
            .proportionVariant(proportionVariant)
        } else {
            GeometryReader { proxy in
                let containerWidth = proxy.size.width
                let itemWidth = containerWidth * proportionVariant.widthFactor
                let itemHeight = itemWidth / proportionVariant.aspectRatio

                ScrollView(.horizontal) {
                    HStack(spacing: .md) {
                        ForEach(Array(items.enumerated()), id: \.offset) { _, item in
                            modelItemView(item)
                                .frame(width: itemWidth, height: itemHeight)
                        }
                    }
                }
                .scrollIndicators(.hidden)
            }
            .aspectRatio(aspectRatio, contentMode: .fit)
            .padding(.vertical, .xxs)
            .padding(.horizontal, .sm)
        }
    }
}

extension SHDCarouselLayout {
    var resolvedProportionVariant: SHDCarouseItemAspectRatio {
        switch self {
        case .groupHorizonal(let proportion):
            return proportion
        default:
            return .oneToOne
        }
    }
}

#Preview {
    SHDCarouselPreview()
}
