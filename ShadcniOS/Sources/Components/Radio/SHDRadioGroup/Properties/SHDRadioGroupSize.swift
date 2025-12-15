//
//  SHDRadioGroupSize.swift
//  ShadcniOS
//
//  Created by JoseAlvarez on 12/15/25.
//

import Foundation

enum SHDRadioGroupSize {
    case md
    case lg

    var outlineCircle: CGFloat {
        switch self {
        case .md: 20
        case .lg: 24
        }
    }

    var filledCircle: CGFloat {
        switch self {
        case .md: 14
        case .lg: 18
        }
    }

    var textStyle: SHDTextStyle {
        switch self {
        case .md: .textBaseMedium
        case .lg: .textLGMedium
        }
    }
}
