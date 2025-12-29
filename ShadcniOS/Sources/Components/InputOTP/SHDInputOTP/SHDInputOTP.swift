//
//  SHDInputOTP.swift
//  ShadcniOS
//
//  Created by JoseAlvarez on 12/9/25.
//

import SwiftUI

internal struct SHDInputOTP: View {
    @State private var viewModel = SHDInputOTPViewModel()
    @FocusState private var focusedField: Int?
    @Binding  var code: String

    let caption: String
    let variant: SHDInputOTPVariant
    let size: SHDInputOTPSizing
    let length: SHDInputOTPLength
    let isError: Bool
    let pattern: SHDInputOTPRegex?

    private var isPatternValid: Bool {
        guard let pattern else { return true }
        return viewModel.validate(code, with: pattern)
    }

    var body: some View {
        @Bindable var vm = viewModel

        VStack(spacing: .sm) {
            HStack(spacing: SHDSizing.Spacing.none.value) {
                ForEach(vm.otpDigits.indices, id: \.self) { index in
                    if viewModel.shouldShowSeparator(
                        at: index,
                        variant: variant,
                        length: length
                    ) {
                        SHDInputOTPSeparator()
                    }

                    let style = viewModel.slotStyle(
                        at: index,
                        totalCount: viewModel.otpDigits.count,
                        variant: variant,
                        length: length
                    )

                    SHDInputOTPItem(
                        position: style.position,
                        text: $vm.otpDigits[index]
                    )
                    .itemSize(size)
                    .isError(isError || !isPatternValid)
                    .onBackspace {
                        if index > 0 {
                            focusedField = index - 1
                        }
                    }
                    .ifLet(pattern) { view, pattern in
                        view.otpPattern(pattern, text: $vm.otpDigits[index])
                    }
                    .focused($focusedField, equals: index)
                    .onChange(of: viewModel.otpDigits[index]) { _, newValue in
                        if let nextFocus = viewModel.handleInputChange(
                            newValue,
                            at: index
                        ) {
                            focusedField = nextFocus
                        }
                    }
                }
            }

            if variant == .controlled {
                Text(caption)
                    .textStyle(size.textStyle)
            }
        }
        .onAppear {
            viewModel.setup(length: length.digits)
        }
        .onChange(of: length) { _, newLength in
            viewModel.otpDigits.removeAll()
            viewModel.setup(length: newLength.digits)
        }
        .onChange(of: viewModel.otpDigits) { _, _ in
            code = viewModel.currentCode
        }
        .onChange(of: focusedField) { _, newFocus in
            if let correctedFocus = viewModel.validateFocus(
                targetIndex: newFocus
            ) {
                focusedField = correctedFocus
            }
        }
    }
}

extension View {
    @ViewBuilder
    func ifLet<Content: View, T>(_ value: T?, transform: (Self, T) -> Content)
        -> some View
    {
        if let value = value {
            transform(self, value)
        } else {
            self
        }
    }
}
