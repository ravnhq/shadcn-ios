import SwiftUI

/// A design-system secure text input dedicated to passwords, with a built-in
/// show/hide toggle and full parity with `SHDTextField` sizing and styling.
///
/// ## Discussion
/// `SHDSecureField` binds to external text, renders a placeholder when empty,
/// supports an optional leading icon, and always shows a trailing eye/eye-off
/// toggle to reveal or obscure the password.
///
/// State handling:
/// - Focus: Shows the primary focus border while active.
/// - Error: Use `inlineError` to surface destructive border/text and a helper message.
/// - Visibility: Tap the eye icon to toggle between `SecureField` and `TextField`.
///
/// - Parameters:
///   - placeholder: Optional placeholder shown when the field is empty.
///   - leadingIcon: Optional icon displayed before the text.
///   - text: Bound value for the input content.
public struct SHDSecureField: View {
    @Environment(\.inlineError) private var inlineError

    @FocusState private var isFocused: Bool
    @State private var isPasswordVisible: Bool = false

    @Binding private var text: String

    private let placeholder: String?
    private let leadingIcon: SHDIconAsset?
    private var size: SHDInputSize = .md

    private var textColor: Color {
        inlineError != nil ? .foregroundDestructiveDefault : .foregroundDefault
    }

    private var visibilityIcon: SHDIconAsset { isPasswordVisible ? .eye : .eyeOff }

    // MARK: - Init
    public init(
        placeholder: String? = nil,
        leadingIcon: SHDIconAsset? = nil,
        text: Binding<String>
    ) {
        self.placeholder = placeholder
        self.leadingIcon = leadingIcon
        _text = text
    }

    // MARK: - View
    public var body: some View {
        HStack(spacing: .sm) {
            if let leadingIcon {
                iconView(leadingIcon)
            }

            ZStack(alignment: .leading) {
                if text.isEmpty, let placeholder {
                    Text(placeholder)
                        .textStyle(size.textStyle)
                        .foregroundColor(.foregroundMuted)
                        .allowsHitTesting(false)
                }

                if isPasswordVisible {
                    TextField("", text: $text)
                        .textStyle(size.textStyle)
                        .foregroundColor(textColor)
                        .focused($isFocused)
                } else {
                    SecureField("", text: $text)
                        .textStyle(size.textStyle)
                        .foregroundColor(textColor)
                        .focused($isFocused)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)

            Button {
                isPasswordVisible.toggle()
            } label: {
                iconView(visibilityIcon)
            }
            .buttonStyle(.plain)
        }
        .padding(.horizontal, .xs)
        .padding(.vertical, size.paddingStyle)
        .backgroundColor(.backgroundDefault)
        .inputBorder(isFocused: isFocused)
        .disabledMask()
    }

    /// Applies the input size, updating text style, icon size, and height tokens.
    /// - Parameter size: Desired input size. Defaults to `.md`.
    /// - Returns: A secure text input configured with the given size.
    public func inputStyle(_ size: SHDInputSize = .md) -> some View {
        mutating(keyPath: \.size, value: size)
    }

    private func iconView(_ icon: SHDIconAsset) -> some View {
        SHDIcon(icon)
            .iconSize(size.iconSize)
            .foregroundColor(.iconDefault)
    }
}
