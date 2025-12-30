//
//  SHDInputOTP.swift
//  ShadcniOS
//
//  Created by JoseAlvarez on 12/9/25.
//

import SwiftUI

public struct SHDInputOTP: View {
    @Binding var code: String
    @FocusState private var focusedField: Int?
    @State private var viewModel = SHDInputOTPViewModel()
    @State private var validationErrorMessage: String?

    private var caption: String = ""
    private var variant: SHDInputOTPVariant = .controlled
    private var size: SHDInputOTPSizing = .md
    private var length: SHDInputOTPLength = .standard
    private var isError: Bool = false
    private var isSeparated: Bool = false
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
        validateError: @escaping (String) -> String? = { _ in nil }

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
                        length: length,
                        isSeparated: isSeparated
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

                    if state.showSeparator && isSeparated {
                        Circle()
                            .fill(SHDColor.iconDefault.color)
                            .frame(width: 4, height: 4)
                            .padding(.horizontal, 8)
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

    public func otpSeparatorStyle(_ isSeparaed: Bool = true) -> Self {
        mutating(keyPath: \.isSeparated, value: isSeparaed)
    }
}

#Preview {
    SHDInputOTPPreview()
}
