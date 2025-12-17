//
//  SHDRadioGroup.swift
//  ShadcniOS
//
//  Created by JoseAlvarez on 12/15/25.
//

import SwiftUI

/// A radio group component used throughout the ShadcniOS design system.
///
/// ## Discussion
/// `SHDRadioGroup` renders mutually exclusive options from a provided array of text labels.
/// Selection is controlled externally via a bound `Int` value representing the index of
/// the selected option, allowing parent views to observe and update which option is
/// currently active.
///
/// Visual styling (size and disabled state) is applied through modifier-style APIs,
/// keeping the core component focused on layout and behavior:
/// - ``radioGroupStyle(_:)`` controls control dimensions and typography using
///   `SHDRadioGroupSize`.
/// - ``disable(_:)`` toggles interactivity while applying a disabled mask.
///
/// Internally, the group composes `SHDRadioItem` views—one for each option in the
/// provided array—and uses the `selection` binding to drive their visual state.
/// When a user taps an item, the binding is updated to the corresponding index.
///
/// - Parameters:
///   - selection: Binding to an `Int` that controls which option is selected (0-based index).
///   - options: Array of label strings for each radio option.
///
/// ## Usage
/// Basic radio group with multiple options:
/// ```swift
/// struct ExampleView: View {
///     @State private var selection: Int = 0
///     @State private var size: SHDRadioGroupSize = .md
///     @State private var isDisabled: Bool = false
///     private var options: [String] = ["Option A", "Option B", "Option C"]
///
///     var body: some View {
///         VStack(spacing: 16) {
///             SHDRadioGroup(
///                 selection: $selection,
///                 options: options
///             )
///             .radioGroupStyle(size)
///             .disable(isDisabled)
///         }
///     }
/// }
/// ```
///
/// ## Related Types
/// - ``SHDRadioGroupSize``
/// - ``SHDRadioItem``
public struct SHDRadioGroup: View {

    @Binding private var selection: Int
    private var size: SHDRadioGroupSize = .md
    private var disable: Bool = false
    private var options: [String]

    public init(
        selection: Binding<Int>,
        options: [String]
    ) {
        self._selection = selection
        self.options = options
    }

    public var body: some View {
        VStack(spacing: .sm) {
            ForEach(options.indices, id: \.self) { index in
                SHDRadioItem(
                    isSelected: selection == index,
                    text: options[index]
                ) {
                    selection = index
                }
                .radioItemStyle(size)
            }
        }
        .disabledMask()
        .disabled(disable)
    }

    /// Applies a visual size to the radio group.
    ///
    /// Use this to switch between medium and large radio treatments while
    /// keeping the selection logic the same.
    ///
    /// - Parameter size: The desired radio size, typically `.md` or `.lg`.
    /// - Returns: A modified `SHDRadioGroup` configured with the given size.
    public func radioGroupStyle(_ size: SHDRadioGroupSize) -> Self {
        mutating(keyPath: \.size, value: size)
    }

    /// Enables or disables user interaction for the radio group.
    ///
    /// When disabled, the group applies a visual disabled mask and prevents
    /// changes to the selection in response to user taps.
    ///
    /// - Parameter disable: Pass `true` to disable the group, `false` to enable it.
    /// - Returns: A modified `SHDRadioGroup` with the disabled state applied.
    public func disable(_ disable: Bool = true) -> Self {
        mutating(keyPath: \.disable, value: disable)
    }
}

#Preview {
    SHDRadioGroupPreview()
}
