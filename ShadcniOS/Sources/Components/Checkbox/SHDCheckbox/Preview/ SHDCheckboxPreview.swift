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
                    description: "Preview of a small checkbox."
                )
                .checkboxStyle(size: .sm)

                SHDCheckbox(
                    label: "Medium checkbox",
                    description: "Preview of a medium checkbox."
                )
                .checkboxStyle(size: .md)

                SHDCheckbox(
                    label: "Large checkbox",
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
                    description: "Default unchecked state."
                )
                .checkboxStyle(size: .md)

                SHDCheckbox(
                    label: "Enabled - Selected",
                    description: "Starts checked and interactive.",
                    isChecked: true
                )
                .checkboxStyle(size: .md)

                SHDCheckbox(
                    label: "Disabled - Unselected",
                    description: "Not interactive."
                )
                .checkboxStyle(size: .md)
                .disabled(true)

                SHDCheckbox(
                    label: "Disabled - Selected",
                    description: "Checked but disabled.",
                    isChecked: true
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
