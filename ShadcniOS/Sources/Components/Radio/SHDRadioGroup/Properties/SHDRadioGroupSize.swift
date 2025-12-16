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
/// struct ExampleView: View {
///     @State private var selection: SHDRadioGroupSelection = .firstOption
///     @State private var size: SHDRadioGroupSize = .md
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
///                 selection: $selection,
///                 textOption1: "Option A",
///                 textOption2: "Option B",
///                 textOption3: "Option C"
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

    var outlineCircle: CGFloat {
        switch self {
        case .md: 20
        case .lg: 24
        }
    }

    var filledCircle: CGFloat {
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
