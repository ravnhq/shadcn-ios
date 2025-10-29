//
//  File.swift
//  shadcn-ios
//
//  Created by JoseAlvarez on 10/28/25.
//

import SwiftUI

public extension Color {
    public static func shadcn(_ name: String) -> Color {
        Color(name, bundle: .module)
    }
}
