//
//  LoginIOSMacApp.swift
//  Shared
//
//  Created by Boris Zinovyev on 28.10.2021.
//

import SwiftUI

@main
struct LoginIOSMacApp: App {
    var body: some Scene {
        
        #if os(iOS)
        WindowGroup {
            ContentView()
        }
        #else
        WindowGroup {
            ContentView()
        }
        .windowStyle(HiddenTitleBarWindowStyle())
        #endif
    }
}
// Check only for MacOS and Disabling focus ring

#if !os(iOS)

extension NSTextField{
    open override var focusRingType: NSFocusRingType{
        get{.none}
        set{}
    }
}
#endif
