//
//  dummyView.swift
//  ShadcniOS
//
//  Created by JoseAlvarez on 11/7/25.
//

import SwiftUI

internal struct DummyView: View {
    var body: some View {
        Text("Taxing Laughter: The Joke Tax Chronicles")
            .textStyle(.h1)
        Divider()
        Text("The peope of the kingdom")
            .textStyle(.h2)
        Divider()
        Text("The Joke Tax")
            .textStyle(.h3)
        Divider()
        Text("People stopped telling jokes")
            .textStyle(.h4)
    }
}

#Preview {
    DummyView()
}
