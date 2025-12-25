//
//  SHDInputOTPViewModel.swift
//  ShadcniOS
//
//  Created by JoseAlvarez on 12/25/25.
//

import Foundation
import Observation

@Observable
final class SHDInputOTPViewModel {
    var otpDigits: [String] = []

    var firstEmptyIndex: Int {
        otpDigits.firstIndex(where: { $0.isEmpty }) ?? (otpDigits.count - 1)
    }

    var currentCode: String {
        otpDigits.joined()
    }

    func setup(length: Int) {
        if otpDigits.count != length {
            otpDigits = Array(repeating: "", count: length)
        }
    }

    func handleInputChange(_ value: String, at index: Int) -> Int? {
        var newValue = value

        if value.count > 1 {
            newValue = String(value.suffix(1))
        }

        otpDigits[index] = newValue

        if newValue.count == 1, index < otpDigits.count - 1 {
            return index + 1
        } else if value.isEmpty, index > 0 {
            return index - 1
        }

        return nil
    }

    func validateFocus(targetIndex: Int?) -> Int? {
        guard let target = targetIndex else { return nil }

        if target > firstEmptyIndex {
            return firstEmptyIndex
        }
        return nil
    }
}
