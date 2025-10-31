//
//  ShadcnSpacingSizing.swift
//  shadcn-ios
//
//  Created by JoseAlvarez on 10/31/25.
//

import Foundation

public enum ShadcnSpacingSizing: Double, CaseIterable {
    /// Spacing Sizing
    case spacingNone = 0
    case spacingXXS = 2
    case spacingXS = 4
    case spacingSM = 8
    case spacingMD = 12
    case spacingLG = 16
    case spacingXL = 24
    case spacingXXL = 32
    case spacing3XL = 40
    case spacing4XL = 64
    
    public var size: CGFloat {
        CGFloat(self.rawValue)
    }
}
