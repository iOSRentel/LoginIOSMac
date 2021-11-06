//
//  Login.swift
//  LoginIOSMac (iOS)
//
//  Created by Boris Zinovyev on 28.10.2021.
//

import SwiftUI

struct Login: View {
    @EnvironmentObject var homeData : LoginViewModel
    
    @State private var showHidePassword = false
    
    var body: some View {
        
        
        
        VStack(alignment: .leading, spacing: 15, content: {
            
            Text("Please Login")
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(Color("FontColor"))
//MARK: Enter Email
            Label(
                title: { TextField("Enter Email", text: $homeData.userName)
                    
//                .keyboardType(.emailAddress)
//      для Мак
                        .textFieldStyle(PlainTextFieldStyle())
                },
                
                
                icon: { Image(systemName: "envelope")
                        .frame(width: 30)
                })
                .foregroundColor(.gray)
            
            Divider()
            
            Label(
                title: { if showHidePassword {
                    TextField("Password", text: $homeData.password)
//      для Мак
                        .textFieldStyle(PlainTextFieldStyle())
                } else {
                    SecureField("Password", text: $homeData.password)
//      для Мак
                        .textFieldStyle(PlainTextFieldStyle())
                }
//MARK: Кнопка показать пароль
                    Button(action: {
                        self.showHidePassword.toggle()
                    }) {
                        Image(systemName: self.showHidePassword ? "eye" : "eye.slash")
                            .resizable()
                            .renderingMode(.template)
                            .frame(width: 20, height: 15)
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(.gray)
                    }
                }, icon: { Image(systemName: "lock")
                        .frame(width: 30)
                })
                .foregroundColor(.gray)
            
            Divider()
            
//MARK: Забыл пароль
            HStack{
                Button(action: homeData.resetPassword, label: {
                    Text("Forgot details?")
                        .font(.caption)
                        .fontWeight(.bold)
                })
// For MacOS
                    .buttonStyle(PlainButtonStyle())
                
                Spacer()
                
//MARK:    To the register page
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
            
            VStack(spacing: 10){
                Button(action: homeData.loginUser) {
                    Text("Sign In")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity)
                        .frame(height: 45)
                        .foregroundColor(Color("FontColor"))
                        .cornerRadius(8)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.gray, lineWidth: 1)
                        )
                }
// For MacOS
                .buttonStyle(PlainButtonStyle())

//MARK:   or
                Text("or")
                    .font(.caption)
                    .foregroundColor(Color.gray)
                    .frame(maxWidth: .infinity, alignment: .center)
                }
            }
        )
        .modifier(LoginViewModifier())
    }
}
