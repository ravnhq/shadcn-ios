//
//  ShadcnColors.swift
//  shadcn-ios
//
//  Created by JoseAlvarez on 10/28/25.
//

import SwiftUI

public enum ShadcnColor: String, CaseIterable {
    case black, white
    case foregroundAccent, foregroundDefault, foregroundDestructiveDefault,
        foregroundDisableDefault, foregroundMuted, foregroundPrimaryDefault,
        foregroundSecondaryDefault, foregroundSuccessDefault,
        foregroundWarningDefault


    public var color: Color {
        Color(rawValue, bundle: .module)
    }
}
