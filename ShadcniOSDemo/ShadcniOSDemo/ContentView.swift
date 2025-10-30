//
//  ContentView.swift
//  ShadcniOSDemo
//
//  Created by JoseAlvarez on 10/28/25.
//

import SwiftUI
import shadcnios

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
                .foregroundColor(Color(ShadcnColors.Charts.Chart4.opacity100))
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
