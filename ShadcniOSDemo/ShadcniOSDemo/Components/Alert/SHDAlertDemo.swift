//
//  SHDAlertDemo.swift
//  ShadcniOSDemo
//
//  Created by JoseAlvarez on 11/21/25.
//

import SwiftUI
import ShadcniOS

enum AlertOption: Hashable {
    case `default`
    case destructive
    case warning
    case success
    
    var style: SHDAlertStyle {
        switch self {
        case .default: .default
        case .destructive: .destructive
        case .warning: .warning
        case .success: .success
        }
    }
    
    var title: String {
        switch self {
        case .default: "Information"
        case .destructive: "This action cannot be undone"
        case .warning: "Action required"
        case .success: "Saved Successfuly"
        }
    }
    
    var messagge: String {
        switch self {
        case .default: "Here is some information you may find useful."
        case .destructive: "Deleting this account will remove all associated data."
        case .warning: "Please review the highlighted details before proceeding."
        case .success: "Your account has been successfully updated."
        }
    }
}


struct SHDAlertDemo: View {

    @State private var option: AlertOption = .default
    
    var body: some View {
        VStack {
            Picker(selection: $option, label: Text("Style")) {
                Text("Default").tag(AlertOption.default)
                Text("Destructive").tag(AlertOption.destructive)
                Text("Warning").tag(AlertOption.warning)
                Text("Success").tag(AlertOption.success)
            }
            
            SHDAlert(title: option.title, message: option.messagge)
                .alertStyle(option.style)
        }
        .navigationTitle("SHDAlert")
    }
}

#Preview {
    SHDAlertDemo()
}
