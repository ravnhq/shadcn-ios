//
//  SHDCardDemoView.swift
//  ShadcniOSDemo
//
//  Created by JoseAlvarez on 12/1/25.
//

import ShadcniOS
import AVKit
import SwiftUI

struct SHDCardDemoView: View {

    @State private var email: String = ""

    @State private var password: String = ""

    var body: some View {
        SHDCard(
            title: "Sign - In",
            description: "Please submit the required information",
            shdBody: shdBody,
            button1Title: "Cancel",
            button2Title: "Register"
        ) {
            print("You have cancelled the registration process")
        } actionButton2: {
            print("You accepted the registration process")
        }
    }

    var shdBody: some View {
        VStack {
            Text("Hello world")
            
            Image(systemName: "person")
                .resizable()
                .frame(width: 100, height: 100)
        }
    }
}

#Preview {
    SHDCardDemoView()
}
