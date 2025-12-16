//
//  SHDRadioItem.swift
//  ShadcniOS
//
//  Created by JoseAlvarez on 12/15/25.
//

import SwiftUI

/// A single radio option used internally by `SHDRadioGroup`.
///
/// ## Discussion
/// `SHDRadioItem` composes a `Toggle` styled with ``ToggleRadioConfiguration`` to
/// render the circular radio indicator and its label. It mirrors the behavior of a
/// standard radio button: when tapped, it requests selection by invoking `onTap`
/// only when transitioning into the selected (`true`) state.
///
/// Visual sizing and typography are driven by ``SHDRadioGroupSize``:
/// - the indicator circles use `outlineCircle` and `filledCircle`
/// - the label uses `textStyle`
///
/// This type is internal to the module and is not intended to be used directly
/// outside of `SHDRadioGroup`.
///
/// - Parameters:
///   - isSelected: Whether this item is currently selected.
///   - text: Optional label for the radio option.
///   - size: The visual size configuration, defaulting to `.md`.
///   - onTap: Closure invoked when the user selects this item.
internal struct SHDRadioItem: View {
    var isSelected: Bool
    var text: String?
    var size: SHDRadioGroupSize = .md
    var onTap: () -> Void

    var body: some View {
        Toggle(
            isOn: Binding(
                get: { isSelected },
                set: { newValue in
                    if newValue {
                        onTap()
                    }
                }
            )
        ) {
            if let text {
                Text(text)
                    .foregroundColor(.foregroundDefault)
                    .textStyle(size.textStyle)
            }
        }
        .toggleStyle(ToggleRadioConfiguration(size: size))
    }

    /// Applies the given size to this radio item.
    ///
    /// This is used by `SHDRadioGroup` to keep all items in sync with the
    /// group’s configured `SHDRadioGroupSize`.
    ///
    /// - Parameter size: The visual size to apply.
    /// - Returns: A copy of the item with the new size.
    func radioItemStyle(_ size: SHDRadioGroupSize) -> Self {
        mutating(keyPath: \.size, value: size)
    }
}
