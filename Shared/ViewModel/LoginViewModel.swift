//
//  LoginViewModel.swift
//  LoginIOSMac (iOS)
//
//  Created by Boris Zinovyev on 28.10.2021.
//

import SwiftUI

class LoginViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
//Register
    @Published var reEnter = ""

// For Goto registration page
    @Published var gotoRegister = false

// MacOS
    var screen: CGRect {
        #if os(iOS)
        return UIScreen.main.bounds
        #else

        return NSScreen.main!.visibleFrame
        #endif
    }

//  Detectiong MacOS
    @Published var ismacOS = false

    init() {
        #if !os(iOS)
        self.ismacOS = true
        #endif
    }
}
