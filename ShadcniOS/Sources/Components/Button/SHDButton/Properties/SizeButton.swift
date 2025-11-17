//
//  SizeButton.swift
//  ShadcniOS
//
//  Created by JoseAlvarez on 11/17/25.
//

import SwiftUI

public enum SizeButton {
    case sm
    case md
    case lg
    
    var textSize: SHDTextStyle {
        switch self {
        case .sm: return .textSMMedium
        case .md: return .textBaseMedium
        case .lg: return .textLGMedium
        }
    }
}
