//
//  LoginIOSMacApp.swift
//  Shared
//
//  Created by Boris Zinovyev on 28.10.2021.
//

import SwiftUI
import Firebase
#if !os(iOS)
import AppKit
#endif

#if os(macOS)
@available(iOS 15.0, macOS 11.0, *)
public typealias NSUIDelegate = NSApplicationDelegate

@main
struct RentelApp: App {
    
    @NSApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .windowStyle(HiddenTitleBarWindowStyle())
    }
}

#elseif os(iOS)
@available(iOS 15.0, macOS 11.0, *)
public typealias NSUIDelegate = UIApplicationDelegate
@main
struct RentelApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

#else
#error("Unsupported platform")
#endif


class AppDelegate: NSObject, NSUIDelegate{
    
#if os(macOS)
    internal func applicationDidFinishLaunching(_ notification: Notification) {
        FirebaseApp.configure()
    }
#else
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        
        return true
    }
#endif
}

#if !os(iOS)
extension NSTextField{
    open override var focusRingType: NSFocusRingType{
        get{.none}
        set{}
    }
}
#endif


//import SwiftUI
//
//@main
//struct LoginIOSMacApp: App {
//    var body: some Scene {
//
//        #if os(iOS)
//        WindowGroup {
//            ContentView()
//        }
//        #else
//        WindowGroup {
//            ContentView()
//        }
//        .windowStyle(HiddenTitleBarWindowStyle())
//        #endif
//    }
//}
//// Check only for MacOS and Disabling focus ring
//
//#if !os(iOS)
//
//extension NSTextField{
//    open override var focusRingType: NSFocusRingType{
//        get{.none}
//        set{}
//    }
//}
//#endif
