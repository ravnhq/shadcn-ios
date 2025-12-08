//
//  SHDCarouselVariant.swift
//  ShadcniOS
//
//  Created by JoseAlvarez on 12/1/25.
//

import Foundation

enum SHDCarouselLayoutVariant {
    case groupHorizonal
    case singleHorizonal
    case groupVertical
}

enum SHDCarouselProprotionVariant {
    case oneToOne
    case threeToFour
    case sixteenToNine

    var width: CGFloat {
        switch self {
        case .oneToOne: 212
        case .threeToFour: 159
        case .sixteenToNine: 377
        }
    }

    var height: CGFloat {
        switch self {
        case .oneToOne: 212
        case .threeToFour: 212
        case .sixteenToNine: 212
        }
    }
}
