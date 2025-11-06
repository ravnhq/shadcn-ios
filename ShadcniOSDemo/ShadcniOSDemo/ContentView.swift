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
                }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
