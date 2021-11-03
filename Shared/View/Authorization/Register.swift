//
//  Register.swift
//  LoginIOSMac (iOS)
//
//  Created by Boris Zinovyev on 28.10.2021.
//

import SwiftUI

struct Register: View {
    @EnvironmentObject var homeData : LoginViewModel
    
    var body: some View{
        
        VStack(alignment: .leading, spacing: 18, content: {
            
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
                        Image(systemName: "arrowshape.turn.up.right")
                            .resizable()
                            .renderingMode(.template)
                            .frame(width: 20, height: 20)
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(Color("FontColor"))
                            .rotationEffect(.init(degrees: 180))
                    })
//      для Мак
                    .buttonStyle(PlainButtonStyle())
                    
                })
                    
                    Label(
                        title: { TextField("Enter Email", text: $homeData.email)
//      для Мак
                        .textFieldStyle(PlainTextFieldStyle())
                        }, icon: { Image(systemName: "envelope")
                                .frame(width: 30)
                        })
                        .foregroundColor(.gray)
                    
                    Divider()
                    
                    Label(
                        title: { TextField("Password", text: $homeData.password)
//      для Мак
                        .textFieldStyle(PlainTextFieldStyle())
                            
                        }, icon: { Image(systemName: "lock")
                                .frame(width: 30)
                        })
                        .foregroundColor(.gray)
                    
                    Divider()
                    
                    Label(
                        title: { TextField("Re-Enter Password", text: $homeData.reEnter)
//      для Мак
                        .textFieldStyle(PlainTextFieldStyle())
                        },
                        icon: { Image(systemName: "lock")
                                .frame(width: 30)
                        })
                        .foregroundColor(.gray)
                    Divider()
                })
                .modifier(LoginViewModifier())
        }
    }
