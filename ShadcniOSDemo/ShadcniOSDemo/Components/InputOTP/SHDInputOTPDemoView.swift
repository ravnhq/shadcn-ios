//
//  SHDInputOTPDemo.swift
//  ShadcniOSDemo
//
//  Created by JoseAlvarez on 12/10/25.
//

import ShadcniOS
import SwiftUI

struct SHDInputOTPDemoView: View {
    
    @State private var selectedVariant: SHDInputOTPVariant = .controlled
    @State private var size: SHDInputOTPSizing = .md
    @State private var length: SHDInputOTPLength = .otp6
    @State private var isError: Bool = false
    @State private var textExtracted: String = ""
    @State private var otp8GroupOf: Int = 2
    
    private var resolvedVariant: SHDInputOTPVariant {
        switch selectedVariant {
        case .separator:
            switch length {
            case .otp4:
                return .separator(groupOf: 2)
            case .otp6:
                return .separator(groupOf: 3)
            case .otp8:
                return .separator(groupOf: otp8GroupOf)
            }

        default:
            return selectedVariant
        }
    }

    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                Picker("Variant", selection: $selectedVariant) {
                    Text("Controlled").tag(SHDInputOTPVariant.controlled)
                    Text("Pattern").tag(SHDInputOTPVariant.pattern)
                    Text("Separator").tag(SHDInputOTPVariant.separator())
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

                if case .separator = selectedVariant, length == .otp8 {
                    Picker("OTP8 grouping", selection: $otp8GroupOf) {
                        Text("2 By 2").tag(2)
                        Text("4 by 4").tag(4)
                    }
                    .pickerStyle(.segmented)
                }

                Spacer().frame(height: 40)

                SHDInputOTP(caption: "Please put the sent code", code: $textExtracted)
                    .inputOTPConfiguration(
                        variant: resolvedVariant,
                        size: size,
                        length: length
                    )
                    .isError(isError)

                SHDButton(label: "Toggle Error") {
                    isError.toggle()
                }
                .buttonVariant(variant: .destructive, size: .md)

                Text("Code generated: \(textExtracted)")
            }
            .padding()
        }
        .navigationTitle("SHDInputOTP")
    }
}



#Preview {
    SHDInputOTPDemoView()
}
