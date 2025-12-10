//
//  SHDInputSlotState.swift
//  ShadcniOS
//
//  Created by JoseAlvarez on 12/9/25.
//

import SwiftUI

enum SHDInputSlotState {
    case idle
    case focused
    case error

    static func currentState(isFocused: Bool, isError: Bool) -> SHDInputSlotState {
        if isFocused { return .focused }
        if isError { return .error }
        return .idle
    }

    var borderColor: SHDColor {
        switch self {
        case .focused: .borderPrimaryDefault
        case .error: .borderDestructiveDefault
        case .idle: .borderDefault
        }
    }

    var borderWidth: CGFloat {
        switch self {
        case .focused: 2
        default: 1
        }
    }

    var zIndex: Double {
        switch self {
        case .focused: return 1
        default: return 0
        }
    }
}
