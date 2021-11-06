//
//  Login.swift
//  LoginIOSMac (iOS)
//
//  Created by Boris Zinovyev on 28.10.2021.
//

import SwiftUI

struct Login: View {
    @EnvironmentObject var homeData : LoginViewModel

    var body: some View {

        VStack(alignment: .leading, spacing: 18, content: {
        
            Text("Please Login")
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(Color("FontColor"))
// Enter Email
            Label(
                title: { TextField("Enter Email", text: $homeData.userName)
//      для Мак
                .textFieldStyle(PlainTextFieldStyle())
                },

                
                icon: { Image(systemName: "envelope")
                        .frame(width: 30)
                })
                .foregroundColor(.gray)
            Divider()
            
// Password
            Label(
                title: { SecureField("Password", text: $homeData.password)
//      для Мак
                .textFieldStyle(PlainTextFieldStyle())
                    
                },
                icon: { Image(systemName: "lock")
                        .frame(width: 30)
                })
                .foregroundColor(.gray)
            
            Divider()
            
// Забыл пароль
            HStack{
                Button(action: homeData.resetPassword, label: {
                    Text("Forgot details?")
                        .font(.caption)
                        .fontWeight(.bold)
                })
// For MacOS
                .buttonStyle(PlainButtonStyle())
                
                Spacer()
                
//    Going to register page
                Button(action: {
                    withAnimation{
                        homeData.gotoRegister.toggle()
                    }
                }, label: {
                    Text("Create account")
                        .font(.caption)
                        .fontWeight(.bold)
                })
// For MacOS
                    .buttonStyle(PlainButtonStyle())

            }
            .foregroundColor(Color("FontColor"))
            
        })
            .modifier(LoginViewModifier())
    }
}
