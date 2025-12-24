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
    @State private var length: SHDInputOTPLength = .standard
    @State private var isError: Bool = false
    @State private var textExtracted: String = ""
    @State private var otp8GroupOf: Int = 2
    
    private var resolvedVariant: SHDInputOTPVariant {
        if length == .extended { return .controlled }
        switch selectedVariant {
        case .separator:
            switch length {
            case .short, .standard, .extended:
                return .separator
            }
        default:
            return selectedVariant
        }
    }

    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                Text("Variants")
                    .font(.headline)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                Picker("Variant", selection: $selectedVariant) {
                    Text("Controlled").tag(SHDInputOTPVariant.controlled)
                    Text("Pattern").tag(SHDInputOTPVariant.pattern)
                    Text("Separator").tag(SHDInputOTPVariant.separator)
                }
                .pickerStyle(.segmented)
                .disabled(length == .extended)

                Text("Sizes")
                    .font(.headline)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                Picker("Size", selection: $size) {
                    Text("SM").tag(SHDInputOTPSizing.sm)
                    Text("MD").tag(SHDInputOTPSizing.md)
                    Text("LG").tag(SHDInputOTPSizing.lg)
                }
                .pickerStyle(.segmented)

                Text("Lengths")
                    .font(.headline)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                Picker("Length", selection: $length) {
                    Text("Short").tag(SHDInputOTPLength.short)
                    Text("Standard").tag(SHDInputOTPLength.standard)
                    Text("Extended").tag(SHDInputOTPLength.extended)
                }
                .pickerStyle(.segmented)
                
                Spacer()
                
                Toggle("Toggle Error", isOn: $isError)

                Spacer().frame(height: 40)

                Text("Preview:")
                    .font(.headline)
                SHDInputOTP(caption: "Please put the sent code", code: $textExtracted)
                    .inputOTPConfiguration(
                        variant: resolvedVariant,
                        size: size,
                        length: length
                    )
                    .isError(isError)

                Text("Code generated: \(textExtracted)")
            }
            .padding()
            .onChange(of: length) { _, newValue in
                if newValue == .extended {
                    selectedVariant = .controlled
                }
            }
        }
        .navigationTitle("SHDInputOTP")
    }
}

#Preview {
    SHDInputOTPDemoView()
}


