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
                    
                    NavigationLink(destination: SHDAlertDemo()) {
                        HStack {
                            Image(systemName: "exclamationmark.3")
                            Text("SHDAlert")
                        }
                    }
                    
                    NavigationLink(destination: SHDAvatarDemo()) {
                        HStack {
                            Image(systemName: "a.circle")
                            Text("SHDAvatar")
                        }
                    }
                    
                    NavigationLink(destination: SHDCardDemoView()) {
                        HStack {
                            Image(systemName: "person.text.rectangle")
                            Text("SHDCard")
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
