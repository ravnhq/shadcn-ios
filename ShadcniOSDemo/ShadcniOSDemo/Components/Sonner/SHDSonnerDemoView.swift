//
//  SHDSonnerDemoView.swift
//  ShadcniOSDemo
//
//  Created by Diego Takaki on 12/16/25.
//

import SwiftUI
import ShadcniOS

struct SHDSonnerDemoView: View {
    @State private var isPresented: Bool = false
    var body: some View {
        VStack {
            Button {
                isPresented.toggle()
            } label: {
                Text("Show Sonner")
            }

        }
        .background(.separator)
        .alert("Test", isPresented: $isPresented) {
            SHDSonner(title: "This is a test",
                      subtitle: "This is a subtitle")
        }
        
    }
}

extension View {
    
}

#Preview {
    SHDSonnerDemoView()
}
