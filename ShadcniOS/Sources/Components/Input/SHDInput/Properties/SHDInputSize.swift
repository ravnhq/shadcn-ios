//
//  SHDInputSize.swift
//  ShadcniOS
//
//  Created by Diego Takaki on 12/8/25.
//

import SwiftUI

public enum SHDInputSize: Sendable {
    case sm

    case md

    case lg

    var textSize: SHDTextStyle {
        switch self {
        case .sm: .textSMMedium
        case .md: .textBaseMedium
        case .lg: .textLGMedium
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
