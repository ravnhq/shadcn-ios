//
//  SHDBadgeDemoView.swift
//  ShadcniOSDemo
//
//  Created by JoseAlvarez on 11/27/25.
//

import ShadcniOS
import SwiftUI

struct SHDBadgeDemoView: View {

    @State private var selectedStatus: String = "New"

    private let statuses: [(label: String, variant: SHDBadgeVariant)] = [
        ("New", .default),
        ("Processing", .secondary),
        ("Cancelled", .destructive),
        ("Returned", .outline),
    ]

    var body: some View {
        VStack(spacing: 20) {

            HStack {
                Text("Type of badge")

                Spacer()

                if let variant = statusVariant(for: selectedStatus) {
                    SHDBadge(text: selectedStatus)
                        .shdBadgeStyle(size: .sm, variant: variant)
                }
            }
            .padding()

            Picker("Status", selection: $selectedStatus) {
                ForEach(statuses, id: \.label) { status in
                    Text(status.label).tag(status.label)
                }
            }
            .pickerStyle(.segmented)

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
