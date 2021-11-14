//
//  PhoneView.swift
//  LoginIOSMac (iOS)
//
//  Created by Boris Zinovyev on 13.11.2021.
//

import SwiftUI

struct PhoneView: View {
    
    @Binding var currentList: Int
    
    var body: some View {
        NavigationView{
            TabView {
                MenuView()
                    .tabItem{
                        Image(systemName: "pencil")
                        Text("Menu")
                }
                    .tag(1)
                OrdersView()
                    .tabItem{
                        Image(systemName: "server.rack")
                        Text("Orders")
                    }
                    .tag(2)
                POSView()
                    .tabItem {
                        Image(systemName: "dollarsign.circle")
                        Text("POS")
                }
                    .tag(3)
                    
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: SettingsView(),label: { Image(systemName: "gear")}
                    )
                }
            }
        }
    }
}
