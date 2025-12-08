//
//  SHDCarouselVariant.swift
//  ShadcniOS
//
//  Created by JoseAlvarez on 12/1/25.
//

import Foundation

public enum SHDCarouselLayoutVariant {
    case groupHorizonal
    case singleHorizonal
    case groupVertical
}

public enum SHDCarouselProportionVariant {
    case oneToOne
    case threeToFour
    case sixteenToNine
    case threeToFourWithSingleItem

    var width: CGFloat {
        switch self {
        case .oneToOne: 212
        case .threeToFour: 159
        case .sixteenToNine: 377
        case .threeToFourWithSingleItem: 380
        }
    }

    var height: CGFloat {
        switch self {
        case .oneToOne: 212
        case .threeToFour: 212
        case .sixteenToNine: 212
        case .threeToFourWithSingleItem: 507
        }
    }
}
