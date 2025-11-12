//
//  SHDAccordionRepresentable.swift
//  ShadcniOS
//
//  Created by JoseAlvarez on 11/12/25.
//

import Foundation

public protocol SHDAccordionRepresentable: Hashable {
    var title: String { get set }
    var content: String { get set }
}
