//
//  SHDSonnerSize.swift
//  ShadcniOS
//
//  Created by Diego Takaki on 12/15/25.
//

import SwiftUI

public enum SHDSonnerSize {
    case sm
    case md
    case lg

    var textStyle: SHDTextStyle {
        switch self {
        case .sm: .textSMMedium
        case .md: .textBaseMedium
        case .lg: .textLGMedium
        }
    }

    var captionStyle: SHDTextStyle {
        switch self {
        case .sm: .textSMRegular
        case .md: .textBaseRegular
        case .lg: .textLGRegular
        }
    }

    var iconSize: SHDIconSize {
        switch self {
        case .sm: .sm
        case .md: .md
        case .lg: .lg
        }
    }
}
