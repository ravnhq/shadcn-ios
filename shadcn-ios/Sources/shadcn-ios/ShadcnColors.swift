//
//  ShadcnColors.swift
//  shadcn-ios
//
//  Created by JoseAlvarez on 10/28/25.
//

import SwiftUI

/// A collection of semantic color definitions inspired by the
/// [shadcn/ui](https://ui.shadcn.com) design system, adapted for SwiftUI.
///
/// `ShadcnColors` provides a structured and theme-aware color palette
/// organized by purpose—such as **foreground**, **background**, **icon**, and **border**.
///
/// Colors are loaded from the Swift package resource bundle (`Bundle.module`),
/// allowing them to be defined via named asset catalogs (e.g. `"Zinc-500"`).
///
/// Example usage:
/// ```swift
/// Text("Hello")
///     .foregroundColor(ShadcnColors.Foreground.foregroundDefault)
///
/// RoundedRectangle(cornerRadius: 8)
///     .fill(ShadcnColors.Background.Primary.default)
/// ```
///
/// All colors automatically adapt to system appearance (`light` / `dark`) where applicable.
public enum ShadcnColors {
    private static let bundle = Bundle.module

    // MARK: - Foreground Colors

    /// Foreground color variants used for text, icons, and essential UI elements.
    public enum Foreground {
        /// Default text color that adapts to light/dark mode.
        public static var foregroundDefault: Color {
            Color(
                UIColor { traitCollection in
                    return traitCollection.userInterfaceStyle == .dark
                        ? UIColor(named: "Zinc-50", in: bundle, compatibleWith: nil)!
                        : UIColor(named: "Zinc-950", in: bundle, compatibleWith: nil)!
                }
            )
        }

        /// Muted foreground color for secondary or less prominent text.
        public static var foregroundMuted: Color {
            Color("Zinc-500", bundle: bundle)
        }

        /// Accent foreground color for emphasis or brand highlights.
        public static var foregroundAccent: Color {
            Color("Zinc-900", bundle: bundle)
        }

        // MARK: Primary

        /// Primary foreground color variant.
        public enum Primary {
            public static var `default`: Color {
                Color(PrimaryColors.primary50, bundle: bundle)
            }
        }

        // MARK: Secondary

        /// Secondary foreground color variant.
        public enum Secondary {
            public static var `default`: Color {
                Color("Zinc-700", bundle: bundle)
            }
        }

        // MARK: Destructive

        /// Destructive foreground color for delete, danger, or alert actions.
        public enum Destructive {
            public static var `default`: Color {
                Color(
                    UIColor { traitCollection in
                        return traitCollection.userInterfaceStyle == .dark
                            ? UIColor(named: "Red-900", in: bundle, compatibleWith: nil)!
                            : UIColor(named: "Red-500", in: bundle, compatibleWith: nil)!
                    }
                )
            }
        }

        // MARK: Success

        /// Success foreground color for positive or confirmation states.
        public enum Success {
            public static var `default`: Color {
                Color("Emerald-700", bundle: bundle)
            }
        }

        // MARK: Warning

        /// Warning foreground color for caution or attention-grabbing states.
        public enum Warning {
            public static var `default`: Color {
                Color("Yellow-700", bundle: bundle)
            }
        }
    }

    // MARK: - Background Colors

    /// Background color palette for surfaces, cards, popovers, and semantic contexts.
    public enum Background {
        private static let bundle = Bundle.module

        // MARK: - Main Backgrounds

        /// Default app background color.
        public static var backgroundDefault: Color {
            Color("White", bundle: bundle)
        }

        /// Card background color for grouped or elevated UI components.
        public static var backgroundCard: Color {
            Color("White", bundle: bundle)
        }

        /// Popover or modal background color.
        public static var backgroundPopover: Color {
            Color("White", bundle: bundle)
        }

        /// Input field background color.
        public static var backgroundInput: Color {
            Color("Zinc-200", bundle: bundle)
        }

        /// Muted background color for less emphasized sections.
        public static var backgroundMuted: Color {
            Color("Zinc-100", bundle: bundle)
        }

        /// Accent background color used for highlights.
        public static var backgroundAccent: Color {
            Color("Zinc-100", bundle: bundle)
        }

        // MARK: Primary Background

        /// Primary background colors used for brand or action surfaces.
        public enum Primary {
            public static var `default`: Color {
                Color(PrimaryColors.primary900, bundle: bundle)
            }

            public static var defaultHover: Color {
                Color(hex: "#18181B").opacity(0.8)
            }

            public static var light: Color {
                Color(PrimaryColors.primary50, bundle: bundle)
            }

            public static var lightHover: Color {
                Color(PrimaryColors.primary100, bundle: bundle)
            }
        }

        // MARK: Secondary Background

        public enum Secondary {
            public static var `default`: Color {
                Color("Zinc-100", bundle: bundle)
            }
        }

        // MARK: Destructive Background

        public enum Destructive {
            public static var `default`: Color {
                Color("Red-600", bundle: bundle)
            }

            public static var defaultHover: Color {
                Color(hex: "#DC2626").opacity(0.8)
            }

            public static var light: Color {
                Color(hex: "#DC2626").opacity(0.1)
            }

            public static var lightHover: Color {
                Color(hex: "#DC2626").opacity(0.2)
            }
        }

        // MARK: Success Background

        public enum Success {
            public static var `default`: Color {
                Color("Emerald-600", bundle: bundle)
            }

            public static var defaultHover: Color {
                Color("Emerald-700", bundle: bundle)
            }

            public static var light: Color {
                Color(hex: "#059669").opacity(0.1)
            }

            public static var lightHover: Color {
                Color(hex: "#059669").opacity(0.12)
            }
        }

        // MARK: Warning Background

        public enum Warning {
            public static var `default`: Color {
                Color("Yellow-500", bundle: bundle)
            }

            public static var defaultHover: Color {
                Color("Yellow-600", bundle: bundle)
            }

            public static var light: Color {
                Color(hex: "#EAB308").opacity(0.1)
            }

            public static var lightHover: Color {
                Color(hex: "#EAB308").opacity(0.12)
            }
        }

        // MARK: Disabled Background

        public enum Disable {
            public static var `default`: Color {
                Color("Neutral-400", bundle: bundle)
            }
        }
    }

    // MARK: - Chart Colors

    /// Predefined color scales for data visualization and charts.
    public enum Charts {
        // MARK: Chart1
        public enum Chart1 {
            private static var baseColor: Color { Color(hex: "2A9D90") }
            public static var opacity100: Color { baseColor }
            public static var opacity80: Color { baseColor.opacity(0.80) }
            public static var opacity50: Color { baseColor.opacity(0.50) }
            public static var opacity10: Color { baseColor.opacity(0.10) }
        }

        // MARK: Chart2
        public enum Chart2 {
            private static var baseColor: Color { Color(hex: "E76E50") }
            public static var opacity100: Color { baseColor }
            public static var opacity80: Color { baseColor.opacity(0.80) }
            public static var opacity50: Color { baseColor.opacity(0.50) }
            public static var opacity10: Color { baseColor.opacity(0.10) }
        }

        // MARK: Chart3
        public enum Chart3 {
            private static var baseColor: Color { Color(hex: "274754") }
            public static var opacity100: Color { baseColor }
            public static var opacity80: Color { baseColor.opacity(0.80) }
            public static var opacity50: Color { baseColor.opacity(0.50) }
            public static var opacity10: Color { baseColor.opacity(0.10) }
        }

        // MARK: Chart4
        public enum Chart4 {
            private static var baseColor: Color { Color(hex: "E8C468") }
            public static var opacity100: Color { baseColor }
            public static var opacity80: Color { baseColor.opacity(0.80) }
            public static var opacity50: Color { baseColor.opacity(0.50) }
            public static var opacity10: Color { baseColor.opacity(0.10) }
        }

        // MARK: Chart5
        public enum Chart5 {
            private static var baseColor: Color { Color(hex: "F4A462") }
            public static var opacity100: Color { baseColor }
            public static var opacity80: Color { baseColor.opacity(0.80) }
            public static var opacity50: Color { baseColor.opacity(0.50) }
            public static var opacity10: Color { baseColor.opacity(0.10) }
        }
    }

    // MARK: - Border Colors

    /// Border colors for outlines, dividers, and input borders.
    public enum Border {
        public static var boderDefault: Color {
            Color("Zinc-200", bundle: bundle)
        }

        public enum Primary {
            public static var `default`: Color {
                Color("Zinc-400", bundle: bundle)
            }
        }

        public enum Destructive {
            public static var `default`: Color {
                Color("Red-500", bundle: bundle)
            }
        }

        public enum Success {
            public static var `default`: Color {
                Color("Emerald-700", bundle: bundle)
            }
        }

        public enum Warning {
            public static var `default`: Color {
                Color("Yellow-600", bundle: bundle)
            }
        }
    }

    // MARK: - Icon Colors

    /// Icon color palette for various semantic contexts.
    public enum Icon {
        public static var iconPrimary: Color {
            Color("Zinc-950", bundle: bundle)
        }

        public static var iconMuted: Color {
            Color("Zinc-500", bundle: bundle)
        }

        public static var iconAccent: Color {
            Color("Zinc-900", bundle: bundle)
        }

        // MARK: Primary
        public enum Primary {
            public static var `default`: Color {
                Color(PrimaryColors.primary50, bundle: bundle)
            }
        }

        // MARK: Secondary
        public enum Secondary {
            public static var `default`: Color {
                Color("Zinc-700", bundle: bundle)
            }
        }

        // MARK: Destructive
        public enum Destructive {
            public static var `default`: Color {
                Color("Red-500", bundle: bundle)
            }

            /// Icon color when placed over a destructive background.
            public static var onDestructive: Color {
                Color("Red-300", bundle: bundle)
            }

            /// Icon color when hovered over a destructive element.
            public static var hoverOnDestructive: Color {
                Color("White", bundle: bundle)
            }
        }

        // MARK: Success
        public enum Success {
            public static var `default`: Color {
                Color("Emerald-700", bundle: bundle)
            }
        }

        // MARK: Warning
        public enum Warning {
            public static var `default`: Color {
                Color("Orange-500", bundle: bundle)
            }
        }

        // MARK: Disabled
        public enum Disable {
            public static var `default`: Color {
                Color("Zinc-400", bundle: bundle)
            }
        }
    }
}
