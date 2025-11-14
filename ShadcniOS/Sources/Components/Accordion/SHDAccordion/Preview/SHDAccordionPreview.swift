//
//  SHDAccordionPreview.swift
//  ShadcniOS
//
//  Created by JoseAlvarez on 11/14/25.
//

import SwiftUI

// MARK: - Preview

/// A simple sample model used to preview the accordion.
struct SampleModel: SHDAccordionRepresentable {
    var title: String
    var content: String
}

struct SHDAccordionPreview: View {
    let sampleItems: [SampleModel] = [
        SampleModel(
            title: "Is it accessible?",
            content: "Yes. It adheres to the WAI-ARIA design pattern."
        ),
        SampleModel(
            title: "Is it styled?",
            content: """
                Stylized accordion moves beyond simple functionality to enhance the
                overall user experience (UX) and visual design of a website or
                application.
                """
        ),
        SampleModel(
            title: "Is it animated?",
            content: """
                Yes, it improves UX by organizing information cleanly and
                allowing users to expand/collapse sections.
                """
        )
    ]

    var body: some View {
        ScrollView {
            VStack(spacing: .xxxl) {
                HStack {
                    Text("SM")
                    SHDAccordion(items: sampleItems)
                        .accordionSize(size: .sm)
                        .padding(.horizontal, 20)
                }

                HStack {
                    Text("MD")
                    SHDAccordion(items: sampleItems)
                        .accordionSize(size: .md)
                        .padding(.horizontal, 20)
                }

                HStack {
                    Text("LG")
                    SHDAccordion(items: sampleItems)
                        .accordionSize(size: .lg)
                        .padding(.horizontal, 20)
                }
            }
            .padding(20)
        }
    }
}
