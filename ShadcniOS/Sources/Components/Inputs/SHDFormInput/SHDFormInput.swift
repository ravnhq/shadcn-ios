//
//  SHDFormInput.swift
//  ShadcniOS
//
//  Created by Concepción Orellana on 12/15/25.
//

import SwiftUI

/// A simple form wrapper that pairs a label, a field, and a caption.
///
/// ## Discussion
/// `SHDFormInput` arranges its content in a vertical stack with a 4pt spacing:
/// - Label text
/// - The provided field view (e.g., `SHDTextField`)
/// - Caption text (supporting text or helper)
///
/// Inline errors provided via `inlineError` take precedence over the caption, mirroring
/// how `SHDCheckbox` centralizes its helper text in one place.
///
/// - Parameters:
///   - label: Leading label text shown above the field. Optional.
///   - caption: Supporting text shown below the field. Optional.
///   - field: The field view to render (e.g., `SHDTextField`).
///
/// ## Usage
/// ```swift
/// SHDFormInput(label: "Email", caption: "We'll never share it.") {
///     SHDTextField(placeholder: "Email address", text: $email)
///         .inputStyle(.md)
/// }
/// ```
public struct SHDFormInput<Field: View>: View {
    @Environment(\.inlineError) private var inlineError

    private let caption: String?
    private let field: Field
    private let label: String?

    public init(
        label: String? = nil,
        caption: String? = nil,
        @ViewBuilder field: () -> Field
    ) {
        self.label = label
        self.caption = caption
        self.field = field()
    }

    public var body: some View {
        VStack(alignment: .leading, spacing: .xs) {
            if let label {
                Text(label)
                    .textStyle(.textSMRegular)
                    .foregroundColor(.foregroundDefault)
            }

            field

            if let inlineError {
                Text(inlineError)
                    .textStyle(.textSMRegular)
                    .foregroundColor(.foregroundDestructiveDefault)
            } else if let caption {
                Text(caption)
                    .textStyle(.textSMRegular)
                    .foregroundColor(.foregroundMuted)
            }
        }
    }
}

#Preview {
    SHDInputPreview()
}

