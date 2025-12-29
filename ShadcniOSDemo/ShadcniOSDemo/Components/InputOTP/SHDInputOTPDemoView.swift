//
//  SHDInputOTPDemo.swift
//  ShadcniOSDemo
//
//  Created by JoseAlvarez on 12/10/25.
//

import ShadcniOS
import SwiftUI

enum VariantOption: String, CaseIterable, Identifiable {
    case controlled = "Default / Joined"
    case separator = "Separator"
    case pattern = "Pattern"

    var id: String { rawValue }
}

enum PatternOption: String, CaseIterable, Identifiable {
    case onlyNumbers = "Only Numbers"
    case onlyLetters = "Only Letters"
    case alphaNumeric = "Alphanumeric"
    case custom = "Custom Regex"

    var id: String { rawValue }
}

struct SHDInputOTPDemoView: View {

    @State private var selectedVariantOption: VariantOption = .controlled
    @State private var size: SHDInputOTPSizing = .md
    @State private var length: SHDInputOTPLength = .standard
    @State private var isError: Bool = false
    @State private var textExtracted: String = ""
    @State private var selectedPatternOption: PatternOption = .onlyNumbers
    @State private var customRegexString: String = "^[a-z0-9]+$"

    private var resolvedVariant: SHDInputOTPVariant {
        if length == .extended { return .controlled }

        switch selectedVariantOption {
        case .controlled:
            return .controlled

        case .separator:
            return .separator

        case .pattern:
            switch selectedPatternOption {
            case .onlyNumbers:
                return .pattern(.onlyNumbers)
            case .onlyLetters:
                return .pattern(.onlyLetters)
            case .alphaNumeric:
                return .pattern(.onlyNumbersAndLetters)
            case .custom:
                return .pattern(.custom(customRegexString))
            }
        }
    }

    var body: some View {
            ScrollView {
                VStack(spacing: 20) {
                    VStack(alignment: .leading) {
                        Text("Variants").font(.headline)
                        
                        Picker("Variant", selection: $selectedVariantOption) {
                            ForEach(VariantOption.allCases) { option in
                                Text(option.rawValue).tag(option)
                            }
                        }
                        .pickerStyle(.segmented)
                        .disabled(length == .extended)
                    }

                    if selectedVariantOption == .pattern {
                        VStack(alignment: .leading, spacing: 10) {
                            Text("Pattern Options").font(.subheadline).foregroundStyle(.secondary)
                            
                            Picker("Regex Type", selection: $selectedPatternOption) {
                                ForEach(PatternOption.allCases) { option in
                                    Text(option.rawValue).tag(option)
                                }
                            }
                            .pickerStyle(.menu)
                            .tint(.blue)
                            .padding(4)
                            .background(Color.gray.opacity(0.1))
                            .cornerRadius(8)
                            
                            if selectedPatternOption == .custom {
                                HStack {
                                    Text("Regex:")
                                    TextField("Enter regex (e.g. ^[0-9]*$)", text: $customRegexString)
                                        .textFieldStyle(.roundedBorder)
                                        .autocorrectionDisabled()
                                        .textInputAutocapitalization(.never)
                                }
                                .transition(.opacity)
                            }
                        }
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 12).stroke(Color.gray.opacity(0.3)))
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

                    Spacer().frame(height: 40)

                    Text("Preview:")
                        .font(.headline)

                    SHDInputOTP(
                        code: $textExtracted,
                        caption: getCaptionForState()
                    )
                    .inputOTPConfiguration(
                        variant: resolvedVariant,
                        size: size,
                        length: length
                    )
                    .isError(isError)

                    Text("Code generated: \(textExtracted)")
                        .monospaced()
                        .padding(.top)
                }
                .padding()
                .onChange(of: length) { _, newValue in
                    if newValue == .extended {
                        selectedVariantOption = .controlled
                    }
                }
                .animation(.easeInOut, value: selectedVariantOption)
                .animation(.easeInOut, value: selectedPatternOption)
            }
            .navigationTitle("SHDInputOTP")
        }
        
        func getCaptionForState() -> String {
            if isError { return "Incorrect code, try again." }
            if case .pattern(let regex) = resolvedVariant {
                switch regex {
                case .onlyNumbers: return "Enter numbers only"
                case .onlyLetters: return "Enter letters only"
                case .onlyNumbersAndLetters: return "Alphanumeric allowed"
                case .custom(let str): return "Custom regex: \(str)"
                }
            }
            return "Enter the code sent to your email"
        }
    }

#Preview {
    SHDInputOTPDemoView()
}
