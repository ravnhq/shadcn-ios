//
//  SHDRadioGroupRepresentable.swift
//  ShadcniOS
//
//  Created by JoseAlvarez on 12/19/25.
//

/// A protocol that defines the requirements for items that can be used in a `SHDRadioGroup`.
///
/// ## Discussion
/// `SHDRadioGroupRepresentable` enables type-safe radio group implementations by allowing
/// any `Hashable` type to be used as a radio option, as long as it provides a `title`
/// property for display.
///
/// This protocol-based approach replaces the previous string-based API, providing:
/// - Type safety: Selection is bound to the actual item type rather than an index
/// - Flexibility: Custom types can include additional properties beyond just a title
/// - Better data modeling: Radio options can be rich data structures, not just strings
///
/// The `Hashable` conformance is required so that items can be uniquely identified
/// and compared for selection state within the radio group.
///
/// ## Conforming to SHDRadioGroupRepresentable
/// To use a custom type with `SHDRadioGroup`, make it conform to this protocol:
/// ```swift
/// struct RadioOption: SHDRadioGroupRepresentable {
///     var title: String
///     var id: UUID
///     var description: String?
/// }
/// ```
///
/// Then use it with `SHDRadioGroup`:
/// ```swift
/// struct ExampleView: View {
///     @State private var selection: RadioOption?
///     private var items = [
///         RadioOption(title: "Option A", id: UUID(), description: "First option"),
///         RadioOption(title: "Option B", id: UUID(), description: "Second option")
///     ]
///
///     var body: some View {
///         SHDRadioGroup(items: items, selection: $selection)
///             .radioGroupStyle(.md)
///     }
/// }
/// ```
///
/// ## Requirements
/// - `title: String`: The text label displayed for this radio option
/// - `id`: An identifier property required by `Identifiable` conformance
/// - `Hashable`: Conformance required for item identification and selection comparison
/// - `Identifiable`: Conformance required for unique item identification in SwiftUI's `ForEach`
///
/// ## Related Types
/// - ``SHDRadioGroup``
public protocol SHDRadioGroupRepresentable: Hashable, Identifiable {
    /// The text label displayed for this radio option.
    var title: String { get }
}
