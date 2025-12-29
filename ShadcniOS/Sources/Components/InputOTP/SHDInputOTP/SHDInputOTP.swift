//
//  SHDInputOTP.swift
//  ShadcniOS
//
//  Created by JoseAlvarez on 12/9/25.
//

import SwiftUI

public struct SHDInputOTP: View {
    @State private var viewModel = SHDInputOTPViewModel()
    @FocusState private var focusedField: Int?
    @Binding var code: String

    var caption: String = ""
    var variant: SHDInputOTPVariant = .controlled
    var size: SHDInputOTPSizing = .md
    var length: SHDInputOTPLength = .standard
    var isError: Bool = false

    private var pattern: SHDInputOTPRegex? {
        if case .pattern(let regex) = variant {
            return regex
        }
        return nil
    }

    private var isPatternValid: Bool {
        guard let pattern else { return true }
        return viewModel.validate(code, with: pattern)
    }

    public init(
        code: Binding<String>,
        caption: String = ""
    ) {
        self._code = code
        self.caption = caption
    }

    public var body: some View {
        @Bindable var vm = viewModel

        VStack(spacing: .sm) {
            HStack(spacing: SHDSizing.Spacing.none.value) {
                ForEach(vm.otpDigits.indices, id: \.self) { index in

                    let state = viewModel.bordersState(
                        at: index,
                        variant: variant,
                        length: length
                    )

                    if state.showSeparator {
                        SHDInputOTPSeparator()
                    }

                    SHDInputOTPItem(
                        text: $vm.otpDigits[index],
                        state: state
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

            Text(caption)
                .textStyle(size.textStyle)
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

    public func inputOTPConfiguration(
        variant: SHDInputOTPVariant = .controlled,
        size: SHDInputOTPSizing = .md,
        length: SHDInputOTPLength = .standard
    ) -> Self {
        return mutating { inputOTP in
            inputOTP.variant = variant
            inputOTP.size = size
            inputOTP.length = length
        }
    }

    public func isError(_ isError: Bool = true) -> Self {
        mutating(keyPath: \.isError, value: isError)
    }
}

#Preview {
    SHDInputOTPPreview()
}

extension View {
    @ViewBuilder
    func ifLet<Content: View, T>(_ value: T?, transform: (Self, T) -> Content)
        -> some View {
        if let value = value {
            transform(self, value)
        } else {
            self
        }
    }
}
