//
//  SHDCarouselPreview.swift
//  ShadcniOS
//
//  Created by JoseAlvarez on 12/1/25.
//

import SwiftUI

internal struct CarouselContentPreview: Identifiable {
    var id = UUID()
    var number: Int
}

internal struct SHDCarouselPreview: View {

    var items = [
        CarouselContentPreview(number: 1),
        CarouselContentPreview(number: 2),
        CarouselContentPreview(number: 3),
        CarouselContentPreview(number: 4),
        CarouselContentPreview(number: 5)
    ]

    var body: some View {
        ScrollView {
            VStack {
                VStack(alignment: .leading, spacing: 16) {
                    Text("Group Horizontal Layout – 1:1")
                        .font(.headline)
                        .padding()

                    SHDCarousel(items) { item in
                        Text("\(item)")
                    }
                }

                VStack(alignment: .leading, spacing: 16) {
                    Text("Group Horizontal Layout – 3:4")
                        .font(.headline)
                        .padding()

                    SHDCarousel(items) { item in
                        Text("\(item)")
                    }
                    .layoutVariant(.groupHorizontal(.threeToFour))
                }

                VStack(alignment: .leading, spacing: 16) {
                    Text("Group Horizontal Layout – 16:9")
                        .font(.headline)
                        .padding()

                    SHDCarousel(items) { item in
                        Text("\(item)")
                    }
                    .layoutVariant(.groupHorizontal(.sixteenToNine))
                }

                VStack(alignment: .leading, spacing: 16) {
                    Text("Single Horizontal Layout (3:4 only)")
                        .font(.headline)
                        .padding()

                    SHDCarousel(items) { item in
                        Text("\(item)")
                    }
                    .layoutVariant(.singleHorizontal)
                }

                VStack(alignment: .leading, spacing: 16) {
                    Text("Vertical Group Layout (16:9 only)")
                        .font(.headline)
                        .padding()

                    SHDCarousel(items) { item in
                        Text("\(item)")
                    }
                    .layoutVariant(.groupVertical)
                }
            }
        }
    }
}

#Preview {
    SHDCarouselPreview()
}
