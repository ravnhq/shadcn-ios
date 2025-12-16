//
//  SHDRadioGroup.swift
//  ShadcniOS
//
//  Created by JoseAlvarez on 12/15/25.
//

import SwiftUI

/// A three-option radio group used throughout the ShadcniOS design system.
///
/// ## Discussion
/// `SHDRadioGroup` renders exactly three mutually exclusive options, each labeled by the
/// provided text values. Selection is controlled externally via a bound
/// `SHDRadioGroupSelection` value so that parent views can observe and update which
/// option is currently active.
///
/// Visual styling (size and disabled state) is applied through modifier-style APIs,
/// keeping the core component focused on layout and behavior:
/// - ``radioGroupStyle(_:)`` controls control dimensions and typography using
///   `SHDRadioGroupSize`.
/// - ``disable(_:)`` toggles interactivity while applying a disabled mask.
///
/// Internally, the group composes three `SHDRadioItem` views—one for each case in
/// `SHDRadioGroupSelection`—and uses the `selection` binding to drive their visual
/// state. When a user taps an item, the binding is updated to the corresponding case.
///
/// - Parameters:
///   - selection: Binding that controls which option is selected.
///   - textOption1: Label text for the first radio option. Defaults to an empty string.
///   - textOption2: Label text for the second radio option. Defaults to an empty string.
///   - textOption3: Label text for the third radio option. Defaults to an empty string.
///
/// ## Usage
/// Basic three-option group:
/// ```swift
/// struct ExampleView: View {
///     @State private var selection: SHDRadioGroupSelection = .firstOption
///     @State private var size: SHDRadioGroupSize = .md
///     @State private var isDisabled: Bool = false
///
///     var body: some View {
///         VStack(spacing: 16) {
///             SHDRadioGroup(
///                 selection: $selection,
///                 textOption1: "Option A",
///                 textOption2: "Option B",
///                 textOption3: "Option C"
///             )
///             .radioGroupStyle(size)
///             .disable(isDisabled)
///         }
///     }
/// }
/// ```
///
/// ## Related Types
/// - ``SHDRadioGroupSelection``
/// - ``SHDRadioGroupSize``
/// - ``SHDRadioItem``
public struct SHDRadioGroup: View {

    @Binding private var selection: SHDRadioGroupSelection
    private var size: SHDRadioGroupSize = .md
    private var disable: Bool = false
    private var textOption1: String
    private var textOption2: String
    private var textOption3: String

    public init(
        selection: Binding<SHDRadioGroupSelection>,
        textOption1: String = "",
        textOption2: String = "",
        textOption3: String = ""
    ) {
        self._selection = selection
        self.textOption1 = textOption1
        self.textOption2 = textOption2
        self.textOption3 = textOption3
    }

    public var body: some View {
        VStack(spacing: .sm) {
            SHDRadioItem(
                isSelected: selection == .firstOption,
                text: textOption1
            ) {
                selection = .firstOption
            }
            .radioItemStyle(size)

            SHDRadioItem(
                isSelected: selection == .secondOption,
                text: textOption2
            ) {
                selection = .secondOption
            }
            .radioItemStyle(size)

            SHDRadioItem(
                isSelected: selection == .thirdOption,
                text: textOption3
            ) {
                selection = .thirdOption
            }
            .radioItemStyle(size)
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
