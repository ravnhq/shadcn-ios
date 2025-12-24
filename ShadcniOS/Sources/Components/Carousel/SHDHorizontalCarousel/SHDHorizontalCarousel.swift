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
/// based on the provided `aspectRatio`. This component is used for group horizontal layouts
/// where users can scroll through items horizontally to see adjacent content.
///
/// The component automatically switches to `SHDHorizontalPagedCarousel` when the `.sixteenToNine`
/// aspect ratio is used, providing a full-width, single-item-at-a-time paged experience.
///
/// The component calculates item dimensions dynamically based on the container width:
/// - Item width: `containerWidth * aspectRatio.widthFactor`
/// - Item height: `itemWidth / aspectRatio.aspectRatio`
///
/// This ensures responsive sizing that adapts to different screen sizes while maintaining
/// the intended aspect ratios. The scroll view hides indicators and applies minimal padding
/// for a clean, focused browsing experience.
///
/// ## Parameters → Init
///
/// - `data`: A `RandomAccessCollection` of `Identifiable` elements to display in the horizontal group.
/// - `content`: A view-builder closure that returns the view for a given element.
/// - `aspectRatio`: The `SHDCarouselItemAspectRatio` determining item dimensions and aspect ratios.
///
internal struct SHDHorizontalCarousel<Data, Content>: View
where Data: RandomAccessCollection, Data.Element: Identifiable, Content: View {

    var data: Data
    var content: (Data.Element) -> Content
    var aspectRatio: SHDCarouselItemAspectRatio = .oneToOne

    var body: some View {
        if aspectRatio == .sixteenToNine {
            SHDHorizontalPagedCarousel(
                data: data,
                content: content
            )
            .aspectRatio(aspectRatio)
        } else {
            GeometryReader { proxy in
                let containerWidth = proxy.size.width
                let itemWidth = containerWidth * aspectRatio.widthFactor
                let itemHeight = itemWidth / aspectRatio.aspectRatio

                ScrollView(.horizontal) {
                    HStack(spacing: .md) {
                        ForEach(data) { item in
                            content(item)
                                .frame(width: itemWidth, height: itemHeight)
                        }
                    }
                }
                .scrollIndicators(.hidden)
            }
            .aspectRatio(aspectRatio.effectiveAspectRatio, contentMode: .fit)
            .padding(.vertical, .xxs)
            .padding(.horizontal, .sm)
        }
    }

    func aspectRatio(_ aspectRatio: SHDCarouselItemAspectRatio) -> Self {
        mutating(keyPath: \.aspectRatio, value: aspectRatio)
    }
}

#Preview {
    SHDCarouselPreview()
}
