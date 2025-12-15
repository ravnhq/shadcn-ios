//
//  SHDInputOTPDemo.swift
//  ShadcniOSDemo
//
//  Created by JoseAlvarez on 12/10/25.
//

import ShadcniOS
import SwiftUI

struct SHDInputOTPDemoView: View {
    
    @State private var variant: SHDInputOTPVariant = .controlled
    @State private var size: SHDInputOTPSizing = .md
    @State private var length: SHDInputOTPLength = .otp6
    @State private var isError: Bool = false
    @State private var dividedBy: Int = 2
    
    var body: some View {
        VStack {
                Picker("Variant", selection: $variant) {
                    Text("Controlled").tag(SHDInputOTPVariant.controlled)
                    Text("Pattern").tag(SHDInputOTPVariant.pattern)
                    Text("Separator").tag(SHDInputOTPVariant.separator(groupOf: dividedBy))
                }
                .pickerStyle(.segmented)
                
                Picker("Size", selection: $size) {
                    Text("SM").tag(SHDInputOTPSizing.sm)
                    Text("MD").tag(SHDInputOTPSizing.md)
                    Text("LG").tag(SHDInputOTPSizing.lg)
                }
                .pickerStyle(.segmented)

                Picker("Length", selection: $length) {
                    Text("4 digits").tag(SHDInputOTPLength.otp4)
                    Text("6 digits").tag(SHDInputOTPLength.otp6)
                    Text("8 digits").tag(SHDInputOTPLength.otp8)
                }
                .pickerStyle(.segmented)

            Spacer()
                .frame(maxHeight: 50)

            SHDInputOTP(caption: "Please put the sended code")
                .inputOTPVariants(variant: variant, size: size, length: length)
                .isError(isError)
            
            SHDButton(label: "Toggle Error") {
                isError.toggle()
            }
            .buttonVariant(variant: .destructive, size: .md)

            Stepper("Custom chunks: \(dividedBy)", value: $dividedBy, in: 0...100)
                .padding()

        }
        .navigationTitle("SHDInputOTP")
    }
}

#Preview {
    SHDInputOTPDemoView()
}
