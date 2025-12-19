//
//  SHDRadioGroupSize.swift
//  ShadcniOS
//
//  Created by JoseAlvarez on 12/15/25.
//

import Foundation

/// Defines the available size variants for `SHDRadioGroup` and related radio items.
///
/// ## Discussion
/// `SHDRadioGroupSize` standardizes both control dimensions and typography for
/// radio groups. Each case maps to:
/// - an outer circle diameter (`outlineCircle`)
/// - an inner filled circle diameter (`filledCircle`)
/// - a label `SHDTextStyle` used by radio option text
///
/// Sizes are typically applied via ``SHDRadioGroup/radioGroupStyle(_:)``, allowing
/// a consistent sizing scheme across the interface while keeping selection logic
/// unchanged.
///
/// ## Usage
/// ```swift
/// struct RadioOption: SHDRadioGroupRepresentable {
///     var title: String
/// }
///
/// struct ExampleView: View {
///     @State private var selection: RadioOption?
///     @State private var size: SHDRadioGroupSize = .md
///     private var items = [
///         RadioOption(title: "Option A"),
///         RadioOption(title: "Option B"),
///         RadioOption(title: "Option C")
///     ]
///
///     var body: some View {
///         VStack {
///             Picker("Size", selection: $size) {
///                 Text("Medium").tag(SHDRadioGroupSize.md)
///                 Text("Large").tag(SHDRadioGroupSize.lg)
///             }
///             .pickerStyle(.segmented)
///
///             SHDRadioGroup(
///                 items: items,
///                 selection: $selection
///             )
///             .radioGroupStyle(size)
///         }
///     }
/// }
/// ```
///
/// ## Cases
/// - `.md`: Medium radio size, used as the default.
/// - `.lg`: Large radio size for emphasized options.
public enum SHDRadioGroupSize {
    /// Medium radio size, used as the default.
    case md
    /// Large radio size for emphasized options.
    case lg

    var outlineCircleSize: CGFloat {
        switch self {
        case .md: 20
        case .lg: 24
        }
    }

    var filledCircleSize: CGFloat {
        switch self {
        case .md: 14
        case .lg: 18
        }
    }

    var textStyle: SHDTextStyle {
        switch self {
        case .md: .textBaseMedium
        case .lg: .textLGMedium
        }
    }
}
