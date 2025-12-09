//
//  SHDInputOTPVariant+Math.swift
//  ShadcniOS
//
//  Created by JoseAlvarez on 12/9/25.
//

extension SHDInputOTPVariant {
    func shouldShowSeparator(at index: Int) -> Bool {
        guard dividedBy > 0 else { return false }
        return index > 0 && index % dividedBy == 0
    }

    func isStartOfGroup(index: Int) -> Bool {
        guard dividedBy > 0 else { return index == 0 }
        return index % dividedBy == 0
    }

    func isEndOfGroup(index: Int, totalCount: Int) -> Bool {
        guard dividedBy > 0 else { return index == totalCount - 1 }
        return (index + 1) % dividedBy == 0 || index == totalCount - 1
    }
}
