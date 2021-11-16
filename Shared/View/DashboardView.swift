//
//  DashboardView.swift
//  LoginIOSMac
//
//  Created by Boris Zinovyev on 14.11.2021.
//

import SwiftUI

struct DashboardView: View {
    @State private var currentList = 0
    
    var body: some View {
        
        #if os(iOS)
        if UIDevice.current.userInterfaceIdiom == .phone {
            PhoneView(currentList: $currentList)
            } else {
                PadView(currentList: $currentList)
            }
        #else
            MacView()
        #endif
        }
    }
