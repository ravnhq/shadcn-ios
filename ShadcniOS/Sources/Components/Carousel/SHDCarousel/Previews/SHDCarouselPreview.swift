//
//  SHDCarouselPreview.swift
//  ShadcniOS
//
//  Created by JoseAlvarez on 12/1/25.
//

import SwiftUI

struct SHDCarouselPreview: View {
    var body: some View {

        SHDCarousel(
            items: [
                10, 10, 10, 10, 10, 10
            ],
        ) { item in
            RoundedRectangle(cornerRadius: item)
                .foregroundColor(.green)
        }
        .carouselLayoutVariant(.groupHorizonal)
        .carouselProportionVariant(.oneToOne)
    }
}

#Preview {
    SHDCarouselPreview()
}
