//
//  SettingsView.swift
//  LoginIOSMac
//
//  Created by Boris Zinovyev on 13.11.2021.
//

import SwiftUI
import Firebase

struct SettingsView: View {
    
    @AppStorage("log_Status") var status = false

    //MARK: - PROPERTIES
    var body: some View {
    VStack(alignment: .center, spacing: 0) {
    // MARK: - FORM
        Form {
            
            Section() {
                    HStack {
                        Image("Samanba")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 60, height: 60)
                            .clipShape(Circle())

                        VStack(alignment: .leading) {
                            Text("Business name")
                                .font(.system(size: 17, weight: .medium, design: .default))
                            Text("Your profile settings, and more")
                                .font(.system(size: 12, weight: .regular, design: .default))
                                .foregroundColor(.gray)
                    }
                }
            }
            Section() {
                FormRowLinkView(icon: "globe", color: Color.pink, text: "Website", link: "https://rentel.me/")
                FormRowLinkView(icon: "textformat.abc.dottedunderline", color: Color.blue, text: "Twitter", link: "https://twitter.com/RentelMe/")
                FormRowLinkView(icon: "link", color: Color.purple, text: "Instagram", link: "https://www.instagram.com/rentel.me/")
            }
            
            Section() {
                FormRowStaticView(icon: "gear", firstText: "Application", secondText: "Rentel POS")
                FormRowStaticView(icon: "checkmark.seal", firstText: "Compatibility", secondText: "iOS, iPadOS")
                FormRowStaticView(icon: "dot.radiowaves.right", firstText: "Connectivity", secondText: "NFC Reader")
                FormRowStaticView(icon: "keyboard", firstText: "Developer", secondText: "Boris Zinovyev")
                FormRowStaticView(icon: "flag", firstText: "App Version", secondText: "1.0.0")
            }
        
        
//MARK: - Exit Button
                
                Button("Log Out", action: {
                    try? Auth.auth().signOut()
                    withAnimation{status = false}
                
        })
                .buttonStyle(PlainButtonStyle())
}
// MARK: - Footer
        Text("Copyright© All rights reserved. RENTEL LLC")
            .modifier(CopyrightModifier())
            .padding()
        }
    .navigationBarTitle("Settings", displayMode: .automatic)
    .background(Color("ColorBackground")
    .edgesIgnoringSafeArea(.all))
    }
}
