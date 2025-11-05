//
//  ContentView.swift
//  ShadcniOSDemo
//
//  Created by JoseAlvarez on 10/28/25.
//

import SwiftUI
import ShadcniOS

struct ContentView: View {
    var body: some View {
        VStack {
            NavigationStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                Text("Hello, world!")
                    .foregroundColor(.foregroundDestructiveDefault)
                NavigationLink(destination: IconShowcaseView()) {
                    Text("Icon Tests")
                        .padding(.all, .xxs)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
