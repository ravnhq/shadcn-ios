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
                    NavigationLink(destination: SHDAccordionDemoView()) {
                        HStack {
                            Image(systemName: "list.bullet.rectangle.portrait")
                            Text("SHDAccordion")
                        }
                    }
                    NavigationLink(destination: SHDButtonDemoView()) {
                        HStack {
                            Image(systemName: "button.horizontal.fill")
                            Text("SHDButton")
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

#Preview {
    ContentView()
}
