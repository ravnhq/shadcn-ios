//
//  SHDTooltipSize.swift
//  ShadcniOS
//
//  Created by JoseAlvarez on 12/17/25.
//

enum SHDTooltipSize {
    case sm
    case md
    case lg

    var textStyle: SHDTextStyle {
        switch self {
        case .sm: .textSMRegular
        case .md: .textBaseRegular
        case .lg: .textLGRegular
        }
    }
}
