//
//  SHDCheckboxPreview.swift
//  ShadcniOS
//
//  Created by Concepción Orellana on 12/4/25.
//

import SwiftUI

internal struct SHDCheckboxPreview: View {
    internal var body: some View {
        VStack(alignment: .leading, spacing: .lg) {
            Text("Sizes")
                .font(.headline)

            VStack(alignment: .leading, spacing: .md) {
                SHDCheckbox(
                    label: "Small checkbox",
                    isChecked: .constant(false),
                    description: "Preview of a small checkbox."
                )
                .checkboxStyle(size: .sm)

                SHDCheckbox(
                    label: "Medium checkbox",
                    isChecked: .constant(true),
                    description: "Preview of a medium checkbox."
                )
                .checkboxStyle(size: .md)

                SHDCheckbox(
                    label: "Large checkbox",
                    isChecked: .constant(false),
                    description: "Preview of a large checkbox."
                )
                .checkboxStyle(size: .lg)
            }

            Divider()

            Text("States")
                .font(.headline)

            VStack(alignment: .leading, spacing: .md) {
                SHDCheckbox(
                    label: "Enabled - Unselected",
                    isChecked: .constant(false),
                    description: "Default unchecked state."
                )
                .checkboxStyle(size: .md)

                SHDCheckbox(
                    label: "Enabled - Selected",
                    isChecked: .constant(true),
                    description: "Starts checked and interactive."
                )
                .checkboxStyle(size: .md)

                SHDCheckbox(
                    label: "Disabled - Unselected",
                    isChecked: .constant(false),
                    description: "Not interactive."
                )
                .checkboxStyle(size: .md)
                .disabled(true)

                SHDCheckbox(
                    label: "Disabled - Selected",
                    isChecked: .constant(true),
                    description: "Checked but disabled."
                )
                .checkboxStyle(size: .md)
                .disabled(true)
            }

            Spacer()
        }
        .padding()
        .previewLayout(.sizeThatFits)
    }
}

#Preview {
    SHDCheckboxPreview()
}
