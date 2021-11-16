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
import Firebase

struct Welcome: View {
    @StateObject var homeData = LoginViewModel()
    
    var body: some View {
        
        HStack(alignment: .bottom, spacing: 0){
            
            VStack{
                
                HStack{
                    
                    Text("RENTEL\nPoint of Sale")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(Color("FontColor"))
                        .padding(.top, 30)
                        .padding(.leading, 15)
                    Spacer()
                }
                .padding()

// Логотип
                Image("kassa")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(15)
                
//      Login Register
                if !homeData.ismacOS{
                    SideLoginView()
                }
            }
            if homeData.ismacOS{
                SideLoginView()
            }
        }
        .overlay(ZStack{if homeData.isLoading{ProgressView()}})
        .frame(maxHeight: .infinity)
        .background(Color("BGColor"))
        //     Error
        .alert(isPresented: $homeData.error, content: {
            Alert(title: Text("Message"), message: Text(homeData.errorMsg), dismissButton: .destructive(Text("Ok"),
            action: {
                withAnimation{homeData.isLoading = false}
                
            }))
        })

//     and eliminated redeclaration
        .environmentObject(homeData)
    }
}
