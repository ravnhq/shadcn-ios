//
//  Shape+Radius.swift
//  ShadcniOS
//
//  Created by JoseAlvarez on 11/20/25.
//

import SwiftUI

extension RoundedRectangle {
    init(cornerRadius radius: SHDSizing.Radius) {
        self.init(cornerRadius: radius.value)
    }
}


