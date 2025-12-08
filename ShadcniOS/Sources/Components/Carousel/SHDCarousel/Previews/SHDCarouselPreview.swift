//
//  SHDCarouselPreview.swift
//  ShadcniOS
//
//  Created by JoseAlvarez on 12/1/25.
//

import SwiftUI

struct SHDCarouselPreview: View {
    var body: some View {

        ScrollView {
            VStack(alignment: .leading, spacing: 32) {

                // MARK: - Group Horizontal Layout Variants
                VStack(alignment: .leading, spacing: 16) {
                    Text("Group Horizontal Layout – 1:1")
                        .font(.headline)
                        .padding()


                    SHDCarousel(
                        items: [1, 2, 3, 4, 5]
                    ) { item in
                        itemView(item)
                    }
                    .carouselLayoutVariant(.groupHorizonal)
                    .carouselProportionVariant(.oneToOne)
                }

                VStack(alignment: .leading, spacing: 16) {
                    Text("Group Horizontal Layout – 3:4")
                        .font(.headline)
                        .padding()

                    SHDCarousel(
                        items: [1, 2, 3, 4, 5]
                    ) { item in
                        itemView(item)
                    }
                    .carouselLayoutVariant(.groupHorizonal)
                    .carouselProportionVariant(.threeToFour)
                }

                VStack(alignment: .leading, spacing: 16) {
                    Text("Group Horizontal Layout – 16:9")
                        .font(.headline)
                        .padding()

                    SHDCarousel(
                        items: [1, 2, 3, 4, 5]
                    ) { item in
                        itemView(item)
                    }
                    .carouselLayoutVariant(.groupHorizonal)
                    .carouselProportionVariant(.sixteenToNine)
                }

                // MARK: - Single Horizontal Layout
                VStack(alignment: .leading, spacing: 16) {
                    Text("Single Horizontal Layout (3:4 only)")
                        .font(.headline)
                        .padding()

                    SHDCarousel(
                        items: [1, 2, 3, 4, 5]
                    ) { item in
                        itemView(item)
                    }
                    .carouselLayoutVariant(.singleHorizonal)
                }

                // MARK: - Vertical Group Layout
                VStack(alignment: .leading, spacing: 16) {
                    Text("Vertical Group Layout (16:9 only)")
                        .font(.headline)
                        .padding()

                    SHDCarousel(
                        items: [1, 2, 3, 4, 5]
                    ) { item in
                        itemView(item)
                    }
                    .carouselLayoutVariant(.groupVertical)
                }
            }
        }
    }

    // MARK: - Extracted Item View
    private func itemView(_ item: Int) -> some View {
        Text("\(item)")
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .backgroundColor(.backgroundAccent)
            .cornerRadius(.md)
    }
}

#Preview {
    SHDCarouselPreview()
}
