//
//  SHDBadgePreview.swift
//  ShadcniOS
//
//  Created by JoseAlvarez on 11/27/25.
//

import SwiftUI

internal struct SHDBadgePreview: View {

    private let sizes: [SHDBadgeSize] = [.sm, .md, .lg]
    private let variants: [SHDBadgeVariant] = [
        .default, .secondary, .outline, .destructive
    ]

    private func title(for variant: SHDBadgeVariant) -> String {
        switch variant {
        case .default: "Default"
        case .secondary: "Secondary"
        case .outline: "Outline"
        case .destructive: "Destructive"
        }
    }

    var body: some View {
        VStack(spacing: 32) {

            ForEach(sizes, id: \.self) { size in
                VStack(alignment: .leading, spacing: 12) {

                    Text("Size: \(String(describing: size))")
                        .font(.subheadline)

                    ForEach(variants, id: \.self) { variant in
                        HStack {
                            SHDBadge(text: "\(title(for: variant)) Badge")
                                .badgeStyle(size: size, variant: variant)
                        }
                    }
                }
            }
        }
        .padding()
    }
}

#Preview {
    SHDBadgePreview()
}
