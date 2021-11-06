//
//  SideLoginView.swift
//  LoginIOSMac
//
//  Created by Boris Zinovyev on 29.10.2021.
//

import SwiftUI

struct SideLoginView: View {
    @EnvironmentObject var homeData: LoginViewModel
    
    var body: some View {
        //  Login / register
        ZStack {
            if homeData.gotoRegister{
                Register()
                    .transition(homeData.ismacOS ? .identity : .scale)
                
            }
            else{
                Login()
                //    scaling problems with Mac
                    .transition(homeData.ismacOS ? .identity : .scale)
            }
        }
    }
}
