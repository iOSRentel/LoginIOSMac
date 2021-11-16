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
//        NavigationView{
            TabView {
                MenuListView(menuListViewModel: MenuListViewModel())
                    .tabItem{
                        Image(systemName: "pencil")
                        Text("Menu")
                }
                    .tag(1)
                CartView()
                    .tabItem{
                        Image(systemName: "server.rack")
                        Text("Orders")
                    }
                    .tag(2)
                NFC()
                    .tabItem {
                        Image(systemName: "wave.3.right.circle")
                        Text("NFC")
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
