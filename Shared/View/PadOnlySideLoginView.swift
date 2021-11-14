//
//  PadOnlySideLoginView.swift
//  LoginIOSMac
//
//  Created by Boris Zinovyev on 14.11.2021.
//


extension View {
    func phoneOnlyStackNavigationView() -> some View {
        
        if UIDevice.current.userInterfaceIdiom == .pad {
            return Welcome()
        } else {
            return SideLoginView()
            
        }
    }
}
