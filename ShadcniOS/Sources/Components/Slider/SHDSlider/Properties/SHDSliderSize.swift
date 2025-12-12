//
//  SHDSliderSize.swift
//  ShadcniOS
//
//  Created by Diego Takaki on 12/12/25.
//

import Foundation

public enum SHDSliderSize {
    case sm
    case md
    case lg

    var sliderSize: CGFloat {
        switch self {
        case .sm: 8
        case .md: 10
        case .lg: 12
        }
    }

    var thumbSize: CGFloat {
        switch self {
        case .sm: 20
        case .md: 24
        case .lg: 28
        }
    }
}
