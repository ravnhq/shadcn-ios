////
////  SHDInputOTPControlled.swift
////  ShadcniOS
////
////  Created by JoseAlvarez on 12/26/25.
////
//
//import SwiftUI
//
//public struct SHDInputOTPPattern: View {
//    @Binding private var code: String
//    private let pattern: SHDInputOTPRegex
//
//    private var caption: String
//    private var variant: SHDInputOTPVariant = .joined
//    private var size: SHDInputOTPSizing = .md
//    private var isError: Bool = false
//    private var length: SHDInputOTPLength = .standard
//
//    public init(
//        code: Binding<String>,
//        caption: String = "",
//        pattern: SHDInputOTPRegex
//    ) {
//        self._code = code
//        self.caption = caption
//        self.pattern = pattern
//    }
//
//    public var body: some View {
//        SHDInputOTP(
//            code: $code,
//            caption: caption,
//            variant: variant,
//            size: size,
//            length: length,
//            isError: isError,
//            pattern: pattern
//        )
//    }
//
//    public func inputOTPConfiguration(
//        variant: SHDInputOTPVariant = .joined,
//        size: SHDInputOTPSizing = .md,
//        length: SHDInputOTPLength = .standard
//    ) -> Self {
//        return mutating { inputOTP in
//            inputOTP.variant = variant
//            inputOTP.size = size
//            inputOTP.length = length
//        }
//    }
//
//    public func isError(_ isError: Bool = true) -> Self {
//        mutating(keyPath: \.isError, value: isError)
//    }
//}
//
//#Preview {
//    @Previewable @State var text: String = ""
//    let hexPattern: SHDInputOTPRegex = .custom("[0-9A-F]")
//
//    SHDInputOTPPattern(
//        code: $text,
//        caption: "This is pattern",
//        pattern: hexPattern
//    )
//}
//
