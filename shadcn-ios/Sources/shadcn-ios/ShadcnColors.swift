//
//  ShadcnColors.swift
//  shadcn-ios
//
//  Created by JoseAlvarez on 10/28/25.
//

import SwiftUI

public enum ShadcnColor: String, CaseIterable {
    case black, white
    case foregroundAccent, foregroundDefault, foregroundDestructiveDefault,
        foregroundDisableDefault, foregroundMuted, foregroundPrimaryDefault,
        foregroundSecondaryDefault, foregroundSuccessDefault,
        foregroundWarningDefault
    case backgroundAccent, backgroundCard, backgroundDefault,
        backgroundDestructiveDefault, backgroundDestructiveLight,
        backgroundDisableDefault, backgroundInput, backgroundMuted,
        backgroundPopover, backgroundPrimaryDefault, backgroundPrimaryLight,
        backgroundSecondaryDefault, backgroundSuccessDefault,
        backgroundSuccessLight,
        backgroundWarningDefault, backgroundWarningLight
    case borderDefault, borderDestructiveDefault, borderSuccessDefault,
        borderPrimaryDefault, borderWarningDefault
    case chartsChart1Opacity10, chartsChart1Opacity50, chartsChart1Opacity80, chartsChart1Opacity100,
    chartsChart2Opacity10, chartsChart2Opacity50, chartsChart2Opacity80, chartsChart2Opacity100,
         chartsChart3Opacity10, chartsChart3Opacity50, chartsChart3Opacity80, chartsChart3Opacity100,
         chartsChart4Opacity10, chartsChart4Opacity50, chartsChart4Opacity80, chartsChart4Opacity100, chartsChart5Opacity10,
         chartsChart5Opacity50, chartsChart5Opacity80, chartsChart5Opacity100
    case iconAccent, iconDefault, iconDestructiveDefault, iconDestructiveOnDestructive, iconDisableDefault, iconMuted, iconPrimaryDefault, iconSecondaryDefault, iconSuccessDefault, iconWarningDefault

    public var color: Color {
        Color(rawValue, bundle: .module)
    }
}
