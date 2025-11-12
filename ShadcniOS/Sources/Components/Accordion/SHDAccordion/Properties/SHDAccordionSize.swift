//
//  SHDAccordionSize.swift
//  ShadcniOS
//
//  Created by JoseAlvarez on 11/12/25.
//

import Foundation
import SwiftUI

public enum SHDAccordionSize {
    case sm, md, lg

    var titleFont: SHDTextStyle {
        switch self {
        case .sm: return .textBaseMedium
        case .md: return .textLGMedium
        case .lg: return .textXLMedium
        }
    }

    var contentFont: SHDTextStyle {
        switch self {
        case .sm: return .textSMRegular
        case .md: return .textBaseRegular
        case .lg: return .textLGRegular
        }
    }

    var verticalPadding: CGFloat {
        switch self {
        case .sm: return 4
        case .md: return 8
        case .lg: return 12
        }
    }
}

