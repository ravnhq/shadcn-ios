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

                    NavigationLink(destination: SHDBadgeDemoView()) {
                        HStack {
                            Image(
                                systemName:
                                    "rectangle.inset.filled.badge.record"
                            )
                            Text("SHDBadge")
                        }
                    }
                    
                    NavigationLink(destination: SHDSliderDemoView()) {
                        HStack {
                            Image(
                                systemName:
                                    "slider.horizontal.3"
                            )
                            Text("SHDSlider")
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
