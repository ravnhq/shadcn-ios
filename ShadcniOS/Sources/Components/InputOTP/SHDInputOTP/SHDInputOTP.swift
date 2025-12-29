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
    @State private var validationErrorMessage: String?

    var caption: String = ""
    var variant: SHDInputOTPVariant = .controlled
    var size: SHDInputOTPSizing = .md
    var length: SHDInputOTPLength = .standard
    var isError: Bool = false

    private let validateError: (String) -> String?

    private var resolvedIsError: Bool {
        isError || validationErrorMessage != nil
    }

    private var resolvedCaption: String {
        validationErrorMessage ?? caption
    }

    public init(
        code: Binding<String>,
        caption: String = "",
        validateError: @escaping (String) -> String? = { _ in nil } // ✅ NEW

    ) {
        self._code = code
        self.caption = caption
        self.validateError = validateError
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

                    SHDInputOTPItem(
                        text: $vm.otpDigits[index],
                        state: state
                    )
                    .itemSize(size)
                    .isError(resolvedIsError)
                    .onBackspace {
                        if index > 0 {
                            focusedField = index - 1
                        }
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

                    if state.showSeparator {
                        SHDInputOTPSeparator()
                    }
                }
            }

            Text(resolvedCaption)
                .textStyle(size.textStyle)
        }
        .onAppear {
            viewModel.setup(length: length.digits)
        }
        .onChange(of: length) { _, newLength in
            viewModel.otpDigits.removeAll()
            viewModel.setup(length: newLength.digits)

            validationErrorMessage = nil
        }
        .onChange(of: viewModel.otpDigits) { _, _ in
            let current = viewModel.currentCode
            code = current

            validationErrorMessage = validateError(current)
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
