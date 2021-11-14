//
//  PadView.swift
//  LoginIOSMac
//
//  Created by Boris Zinovyev on 13.11.2021.
//

import SwiftUI

struct PadView: View {
    
    @Binding var currentList: Int

    var body: some View {
        NavigationView{
            SettingsView()
            OrdersView()
            POSView()
        }
    }
}
