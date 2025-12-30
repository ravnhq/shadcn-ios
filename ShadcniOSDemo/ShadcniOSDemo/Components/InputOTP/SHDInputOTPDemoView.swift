//
//  SHDInputOTPDemo.swift
//  ShadcniOSDemo
//
//  Created by JoseAlvarez on 12/10/25.
//

import ShadcniOS
import SwiftUI

enum PatternOption: String, CaseIterable, Identifiable {
    case onlyNumbers = "Only Numbers"
    case onlyLetters = "Only Letters"
    case alphaNumeric = "Alphanumeric"

    var id: String { rawValue }

    var keyboardType: UIKeyboardType {
        switch self {
        case .onlyNumbers: .decimalPad
        case .onlyLetters: .asciiCapable
        case .alphaNumeric: .default
        }
    }
}

struct SHDInputOTPDemoView: View {

    @State private var variant: SHDInputOTPVariant = .controlled
    @State private var size: SHDInputOTPSizing = .md
    @State private var length: SHDInputOTPLength = .standard
    @State private var isError: Bool = false
    @State private var textExtracted: String = ""
    @State private var selectedPatternOption: PatternOption = .onlyNumbers
    @State private var isSeparated: Bool = false

    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                VStack(alignment: .leading) {
                    Text("Variants").font(.headline)

                    Picker("Variant", selection: $variant) {
                        Text("Controlled").tag(SHDInputOTPVariant.controlled)
                        Text("Pattern").tag(SHDInputOTPVariant.pattern)
                    }
                    .pickerStyle(.segmented)
                    .disabled(length == .extended)
                }

                if variant == .pattern {
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Pattern Options").font(.subheadline)
                            .foregroundStyle(.secondary)

                        Picker("Regex Type", selection: $selectedPatternOption)
                        {
                            ForEach(PatternOption.allCases) { option in
                                Text(option.rawValue).tag(option)
                            }
                        }
                        .pickerStyle(.menu)
                        .tint(.blue)
                        .padding(4)
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(8)
                    }
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 12).stroke(
                            Color.gray.opacity(0.3)
                        )
                    )
                }

                Divider()

                VStack(alignment: .leading) {
                    Text("Sizes").font(.headline)
                    Picker("Size", selection: $size) {
                        Text("SM").tag(SHDInputOTPSizing.sm)
                        Text("MD").tag(SHDInputOTPSizing.md)
                        Text("LG").tag(SHDInputOTPSizing.lg)
                    }
                    .pickerStyle(.segmented)
                }

                VStack(alignment: .leading) {
                    Text("Lengths").font(.headline)
                    Picker("Length", selection: $length) {
                        Text("Short").tag(SHDInputOTPLength.short)
                        Text("Standard").tag(SHDInputOTPLength.standard)
                        Text("Extended").tag(SHDInputOTPLength.extended)
                    }
                    .pickerStyle(.segmented)
                }

                Spacer().frame(height: 20)

                Toggle("Toggle Error State", isOn: $isError)
                
                Toggle("Set separators", isOn: $isSeparated)

                Spacer().frame(height: 40)

                Text("Preview:")
                    .font(.headline)

                SHDInputOTP(
                    code: $textExtracted,
                    caption:
                        "This caption can be applied for all input variants",
                    validateError: validateOTP
                )
                .inputOTPConfiguration(
                    variant: variant,
                    size: size,
                    length: length
                )
                .otpSeparatorStyle(isSeparated)
                .isError(isError)
                .keyboardType(selectedPatternOption.keyboardType)

                Text("Code generated: \(textExtracted)")
                    .monospaced()
                    .padding(.top)
            }
            .padding()
            .onChange(of: length) { _, newValue in
                if newValue == .extended {
                    variant = .controlled
                }
            }
        }
        .navigationTitle("SHDInputOTP")
    }

    func validateOTP(_ value: String) -> String? {
        if value.isEmpty { return nil }

        if selectedPatternOption == .onlyNumbers {
            if value.rangeOfCharacter(from: CharacterSet.decimalDigits.inverted)
                != nil
            {
                return "Only numbers are allowed."
            }
        }

        if selectedPatternOption == .onlyLetters {
            if value.rangeOfCharacter(from: CharacterSet.letters.inverted)
                != nil
            {
                return "Only letters are allowed."
            }
        }

        if Set(value).count == 1, value.first == "0" {
            return "Invalid code."
        }

        return nil
    }
}

#Preview {
    SHDInputOTPDemoView()
}
