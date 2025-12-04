//
//  SHDBadgeDemoView.swift
//  ShadcniOSDemo
//
//  Created by JoseAlvarez on 11/27/25.
//

import ShadcniOS
import SwiftUI

struct SHDBadgeDemoView: View {

    @State private var selectedStatus: String = "Default"

    @State private var selectedSize: SHDBadgeSize = .md

    private let statuses: [(label: String, variant: SHDBadgeVariant)] = [
        ("Default", .default),
        ("Secondary", .secondary),
        ("Destructive", .destructive),
        ("Outline", .outline),
    ]

    private let sizes: [SHDBadgeSize] = [.sm, .md, .lg]

    var body: some View {
        VStack(spacing: 20) {

            HStack {
                Text("Type of badge")

                Spacer()

                if let variant = statusVariant(for: selectedStatus) {
                    SHDBadge(text: selectedStatus)
                        .badgeStyle(size: selectedSize, variant: variant)
                }
            }
            .padding()

            Picker("Status", selection: $selectedStatus) {
                ForEach(statuses, id: \.label) { status in
                    Text(status.label).tag(status.label)
                }
            }
            .pickerStyle(.segmented)

            Picker("Size", selection: $selectedSize) {
                Text("Small").tag(SHDBadgeSize.sm)
                Text("Medium").tag(SHDBadgeSize.md)
                Text("Large").tag(SHDBadgeSize.lg)
            }
            .pickerStyle(.palette)

            Spacer()
        }
        .padding()
        .navigationTitle("SHDBadge")
    }

    private func statusVariant(for label: String) -> SHDBadgeVariant? {
        statuses.first(where: { $0.label == label })?.variant
    }
}

#Preview {
    NavigationStack {
        SHDBadgeDemoView()
    }
}
