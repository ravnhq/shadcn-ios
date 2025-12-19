//
//  InputStyle.swift
//  ShadcniOS
//
//  Created by Concepción Orellana on 12/4/25.
//

import SwiftUI

internal extension View {
    /// Applies sizing tokens to `SHDTextInput` (text style, icon size, padding/height via state).
    ///
    /// - Parameters:
    ///   - size: Desired input size. Defaults to `.md`.
    /// - Returns: A view configured with the given size.
    func inputStyle(_ size: SHDInputSize = .md) -> some View {
        self
            .environment(\.inputTextStyle, size.textStyle)
    }
}

// MARK: - Environment Keys

private struct InputTextStyleKey: EnvironmentKey {
    static let defaultValue: SHDTextStyle = .textBaseRegular
}

internal extension EnvironmentValues {
    var inputTextStyle: SHDTextStyle {
        get { self[InputTextStyleKey.self] }
        set { self[InputTextStyleKey.self] = newValue }
    }

}
