//
//  Register.swift
//  LoginIOSMac (iOS)
//
//  Created by Boris Zinovyev on 28.10.2021.
//

import SwiftUI

struct Register: View {
    @EnvironmentObject var homeData : LoginViewModel
    
    @State private var showHidePassword = false

    
    var body: some View{
        
        VStack(alignment: .leading, spacing: 15, content: {
            
            Label(
                title: {
                    Text("Please Register")
                        .font(.title2)
                        .fontWeight(.bold)
                    .foregroundColor(Color("FontColor")) },
                
                
                icon: {
// Back button
                    Button(action: {
                        //крутилка
                        withAnimation{
                            homeData.gotoRegister.toggle()
                        }
                    }, label: {
                        Image(systemName: "chevron.backward.square")
                            .resizable()
                            .renderingMode(.template)
                            .frame(width: 20, height: 20)
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(Color("FontColor"))
                            .padding(4)
                    })
//      для Мак
                    .buttonStyle(PlainButtonStyle())
                    
                })
                    
// Enter email
                    Label(
                        title: { TextField("Enter Email", text: $homeData.registerUserName)
//                                .keyboardType(.emailAddress)

//      для Мак
                        .textFieldStyle(PlainTextFieldStyle())
                        }, icon: { Image(systemName: "envelope")
                                .frame(width: 30)
                        })
                        .foregroundColor(.gray)
                    
                    Divider()
                    
// Password
            Label(
                title: { if showHidePassword {
                    TextField("Password", text: $homeData.registerPassword)
//      для Мак
                        .textFieldStyle(PlainTextFieldStyle())
                } else {
                    SecureField("Password", text: $homeData.registerPassword)
//      для Мак
                        .textFieldStyle(PlainTextFieldStyle())
                }

                }, icon: { Image(systemName: "lock")
                        .frame(width: 30)
                })
                .foregroundColor(.gray)
                    
                    Divider()

// Re-Enter Password
            Label(
                title: { if showHidePassword {
                    TextField("Re-enter Password", text: $homeData.reEnterPassword)
//      для Мак
                        .textFieldStyle(PlainTextFieldStyle())
                } else {
                    SecureField("Re-enter Password", text: $homeData.reEnterPassword)
//      для Мак
                        .textFieldStyle(PlainTextFieldStyle())
                }
// Кнопка показать пароль
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
                }, icon: { Image(systemName: "lock.rotation")
                        .frame(width: 30)
                })
                .foregroundColor(.gray)
            
            Button(action: homeData.registerUser) {
                Text("Register")
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
            .buttonStyle(PlainButtonStyle())                })
                .modifier(LoginViewModifier())
        }
    }

