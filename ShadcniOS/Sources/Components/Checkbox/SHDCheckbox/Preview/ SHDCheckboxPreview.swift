//
//  SHDCheckboxPreview.swift
//  ShadcniOS
//
//  Created by Concepción Orellana on 12/4/25.
//

import SwiftUI

internal struct SHDCheckboxPreview: View {
    internal var body: some View {
        VStack(spacing: 16) {
            SHDCheckbox(
                label: "Accept terms and conditions",
                description: "You agree to our Terms of Service and Privacy Policy."
            )

            Spacer()
        }
        .padding()
        .previewLayout(.sizeThatFits)
    }
}

#Preview {
    SHDCheckboxPreview()
}
