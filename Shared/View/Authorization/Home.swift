//
//  Home.swift
//  LoginIOSMac (iOS)
//
//  Created by Boris Zinovyev on 28.10.2021.
// https://www.youtube.com/watch?v=ElexpjhTKzA&t=259s
// 11:26 начинается шайтан с Мак
// 12:54 if iOS else MacOS
// 14:16 !!!!!

import SwiftUI

struct Home: View {
@StateObject var homeData = LoginViewModel()
    
    var body: some View {
        
        HStack(alignment: .bottom, spacing: 0){
            
        VStack{
            
            HStack{
                
                Text("RENTEL\nPoint of Sale")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(Color("FontColor"))
                    .padding(.leading, 25)
                
                Spacer()
            }
            .padding()

            // Логотип
            Image("kassa")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding()
                .padding(.horizontal)
//      Login Register
            if !homeData.ismacOS{
            SideLoginView()
            }
    }
            if homeData.ismacOS{
                SideLoginView()
            }
}
        .frame(maxHeight: .infinity)
        .background((homeData.ismacOS ? nil : Color("BGColor"))
        .ignoresSafeArea(.all, edges: .all))

//        //and eliminated redeclaration
        .environmentObject(homeData)
    }
}
