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
            Label(
                title: { TextField("Password", text: $homeData.password)
//      для Мак
                .textFieldStyle(PlainTextFieldStyle())
                    
                },
                icon: { Image(systemName: "lock")
                        .frame(width: 30)
                })
                .foregroundColor(.gray)
            
            Divider()
            
            HStack{
                Button(action: {}, label: {
                    Text("Forgot details?")
                        .font(.caption)
                        .fontWeight(.bold)
                })
// For MacOS
                .buttonStyle(PlainButtonStyle())
                
                Spacer()
                
                Button(action: {
//         Going to register page
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
