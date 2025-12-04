//
//  SHDCardPreview.swift
//  ShadcniOS
//
//  Created by JoseAlvarez on 11/28/25.
//

import SwiftUI

internal struct SHDCardPreview: View {
    @State var name: String = ""
    @State var type: String = ""

    var body: some View {
        SHDCard(
            title: "Create project",
            description: "Deploy your new project in one-click.",
            shdBody: shdBody,
            button1Title: "Button",
            button2Title: "Button"
        ) {
            print("button 1")
        } actionButton2: {
            print("button 2")
        }
    }

    var shdBody: some View {
        VStack {
            Text("Name")
                .frame(maxWidth: .infinity, alignment: .leading)
            TextField("Name of your project", text: $name)
                .textFieldStyle(.roundedBorder)
            Text("Framework")
                .frame(maxWidth: .infinity, alignment: .leading)
            TextField("Type", text: $type)
                .textFieldStyle(.roundedBorder)
        }
    }
}

#Preview {
    SHDCardPreview()
}
