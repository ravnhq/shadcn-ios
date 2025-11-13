//
//  ContentView.swift
//  ShadcniOSDemo
//
//  Created by JoseAlvarez on 10/28/25.
//

import ShadcniOS
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            NavigationStack {
                List {
                    NavigationLink(destination: AccordionView()) {
                        HStack {
                            Image(systemName: "list.bullet.rectangle.portrait")
                            Text("Accordion")
                        }
                    }
                }
                .navigationTitle(Text("ShadcniOS Demo"))
                .listStyle(SidebarListStyle())
            }
            .redacted(reason: .invalidated)
        }
    }
}

struct dummyModel: SHDAccordionRepresentable {
    var title: String
    var content: String
}

struct AccordionView: View {
    let dummyData: [dummyModel] = [
        dummyModel(
            title: "Hello from Demo",
            content: "Expanded content from demo"
        ),
        dummyModel(
            title: "Hello from Demo 2",
            content: "Expanded content from demo 2"
        ),
        dummyModel(
            title: "Hello from Demo 3",
            content: "Expanded content from demo 3"
        ),
    ]

    var body: some View {
        SHDAccordion(items: dummyData)
            .padding(.horizontal, 20)
            .accordionStyle(size: .sm)
        SHDAccordion(items: dummyData)
            .padding(.horizontal, 20)
            .accordionStyle(size: .md)
        SHDAccordion(items: dummyData)
            .padding(.horizontal, 20)
            .accordionStyle(size: .lg)
    }
}

#Preview {
    ContentView()
}
