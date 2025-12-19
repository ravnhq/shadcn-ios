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
/// `SHDRadioGroup` renders mutually exclusive options from a provided array of items
/// conforming to ``SHDRadioGroupRepresentable``. Selection is controlled externally via
/// a bound optional value of the item type, allowing parent views to observe and update
/// which option is currently active.
///
/// Visual styling (size and disabled state) is applied through modifier-style APIs,
/// keeping the core component focused on layout and behavior:
/// - ``radioGroupStyle(_:)`` controls control dimensions and typography using
///   `SHDRadioGroupSize`.
/// - ``disabled(_:)`` toggles interactivity while applying a disabled mask.
///
/// Internally, the group composes `SHDRadioItem` views—one for each item in the
/// provided array—and uses the `selection` binding to drive their visual state.
/// When a user taps an item, the binding is updated to the corresponding item instance.
///
/// - Parameters:
///   - items: Array of items conforming to `SHDRadioGroupRepresentable` for each radio option.
///   - selection: Binding to an optional item that controls which option is selected.
///
/// ## Usage
/// Basic radio group with a custom type:
/// ```swift
/// struct RadioOption: SHDRadioGroupRepresentable {
///     var title: String
/// }
///
/// struct ExampleView: View {
///     @State private var selection: RadioOption?
///     @State private var size: SHDRadioGroupSize = .md
///     @State private var isDisabled: Bool = false
///     private var items = [
///         RadioOption(title: "Option A"),
///         RadioOption(title: "Option B"),
///         RadioOption(title: "Option C")
///     ]
///
///     var body: some View {
///         VStack(spacing: 16) {
///             SHDRadioGroup(
///                 items: items,
///                 selection: $selection
///             )
///             .radioGroupStyle(size)
///             .disabled(isDisabled)
///         }
///     }
/// }
/// ```
///
/// ## Related Types
/// - ``SHDRadioGroupRepresentable``
/// - ``SHDRadioGroupSize``
/// - ``SHDRadioItem``
public struct SHDRadioGroup<Item: SHDRadioGroupRepresentable>: View {

    @Binding private var selection: Item?
    private var size: SHDRadioGroupSize = .md
    private var items: [Item]

    public init(
        items: [Item],
        selection: Binding<Item?>

    ) {
        self.items = items
        self._selection = selection
    }

    public var body: some View {
        VStack(spacing: .sm) {
            ForEach(items, id: \.self) { item in
                SHDRadioItem(
                    isSelected: selection == item,
                    text: item.title
                ) {
                    selection = item
                }
                .radioItemStyle(size)
            }
        }
        .disabledMask()
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
}

#Preview {
    SHDRadioGroupPreview()
}
