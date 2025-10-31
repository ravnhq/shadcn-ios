//
//  ShadcnSizing.swift
//  shadcn-ios
//
//  Created by JoseAlvarez on 10/31/25.
//

import Foundation

public enum ShadcnRadiusSizing: Double, CaseIterable {
    /// Radius Sizing 
    case radiusNone = 0
    case radiusXS = 2
    case radiusSM = 4
    case radiusMD = 8
    case radiusLG = 12
    case radiusXL = 16
    case radiusXXL = 24
    case radiusFull = 400
    
    public var size: CGFloat {
        CGFloat(self.rawValue)
    }
}
