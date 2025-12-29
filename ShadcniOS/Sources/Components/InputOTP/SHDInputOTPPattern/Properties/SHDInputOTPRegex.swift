//
//  SHDInputOTPRegex.swift
//  ShadcniOS
//
//  Created by JoseAlvarez on 12/26/25.
//

public enum SHDInputOTPRegex: Hashable {
    case onlyNumbers
    case onlyLetters
    case onlyNumbersAndLetters
    case custom(String)
}
