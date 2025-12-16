//
//  SHDRadioGroupSelection.swift
//  ShadcniOS
//
//  Created by JoseAlvarez on 12/15/25.
//

/// Represents the selected option in an `SHDRadioGroup`.
///
/// ## Discussion
/// `SHDRadioGroupSelection` is the model used to track which of the three radio
/// options is active. Each case maps directly to a rendered radio item, allowing
/// parent views to read and update selection in a type-safe way.
///
/// Typical usage is to bind this enum to an `SHDRadioGroup` instance and update
/// it reactively in response to user interaction or programmatic changes.
///
/// ## Usage
/// ```swift
/// struct ExampleView: View {
///     @State private var selection: SHDRadioGroupSelection = .firstOption
///
///     var body: some View {
///         SHDRadioGroup(
///             selection: $selection,
///             textOption1: "First",
///             textOption2: "Second",
///             textOption3: "Third"
///         )
///     }
/// }
///
/// // Programmatically update the selection
/// selection = .secondOption
/// ```
///
/// ## Cases
/// - `.firstOption`: The first radio option in the group.
/// - `.secondOption`: The second radio option in the group.
/// - `.thirdOption`: The third radio option in the group.
public enum SHDRadioGroupSelection {
    /// Selects the first option in the radio group.
    case firstOption
    /// Selects the second option in the radio group.
    case secondOption
    /// Selects the third option in the radio group.
    case thirdOption
}
