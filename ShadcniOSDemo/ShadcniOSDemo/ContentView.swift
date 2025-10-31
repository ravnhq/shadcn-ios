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
            ForEach(ShadcnColor.allCases, id: \.self) { color in
                Text("Hello, world!")
                    .foregroundColor(color.color)
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
