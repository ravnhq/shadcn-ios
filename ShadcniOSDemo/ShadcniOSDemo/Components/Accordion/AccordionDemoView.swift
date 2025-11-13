//
//  AccordionDemoView.swift
//  ShadcniOSDemo
//
//  Created by JoseAlvarez on 11/13/25.
//

import ShadcniOS
import SwiftUI

struct sampleModel: SHDAccordionRepresentable {
    var title: String
    var content: String
}

struct AccordionDemoView: View {
    let sampleData = [
        sampleModel(
            title: "Is it accessible?",
            content: "Yes. It adheres to the WAI-ARIA design pattern."
        ),
        sampleModel(
            title: "Is it styled?",
            content:
                "Stylized accordion moves beyond simple functionality to enhance the overall user experience (UX) and visual design of a website or application, integrating seamlessly with the site's style guide"
        ),
        sampleModel(
            title: "Is it animated?",
            content:
                "Yes, It improves user experience by organizing information in a clean way, allowing users to click on a title to expand and see details, and then click again to collapse it"
        ),
    ]

    var body: some View {
        VStack {
            HStack {
                Text("SM")
                SHDAccordion(items: sampleData)
                    .accordionStyle(size: .sm)
                    .padding(.horizontal, 20)
            }

            Spacer()

            HStack {
                Text("MD")
                SHDAccordion(items: sampleData)
                    .accordionStyle(size: .md)
                    .padding(.horizontal, 20)
            }

            Spacer()

            HStack {
                Text("LG")
                SHDAccordion(items: sampleData)
                    .accordionStyle(size: .lg)
                    .padding(.horizontal, 20)
            }
        }
        .padding(.all, 20)
    }
}
