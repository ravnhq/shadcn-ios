////
////  SHDInputOTPControlled.swift
////  ShadcniOS
////
////  Created by JoseAlvarez on 12/29/25.
////
//
//import SwiftUI
//
//public struct SHDInputOTPControlled: View {
//    @Binding private var code: String
//
//    private var caption: String
//    private var variant: SHDInputOTPVariant = .controlled
//    private var size: SHDInputOTPSizing = .md
//    private var isError: Bool = false
//    private var length: SHDInputOTPLength = .standard
//
//    public init(
//        code: Binding<String>,
//        caption: String = ""
//    ) {
//        self._code = code
//        self.caption = caption
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
//            pattern: nil
//        )
//    }
//
//    public func inputOTPConfiguration(
//        variant: SHDInputOTPVariant = .controlled,
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
//
//    SHDInputOTPControlled(
//        code: $text,
//        caption: "This is controlled",
//    )
//}
