//
//  SettingsView.swift
//  LoginIOSMac
//
//  Created by Boris Zinovyev on 13.11.2021.
//

import SwiftUI
import Firebase

struct SettingsView: View {
    
    @State private var isShowingAlert = false
    
    @AppStorage("log_Status") var status = false

    var body: some View {
        
        VStack(alignment: .center, spacing: 0) {
// MARK: - FORM
            
        Form {
            
//MARK: - Profile
            Section() {
                ProfileInfo()
            }
            
//MARK: - Link
            Section() {
                FormRowLinkView(icon: "globe", color: Color.pink, text: "Website", link: "https://rentel.me/")
                FormRowLinkView(icon: "textformat.abc.dottedunderline", color: Color.blue, text: "Twitter", link: "https://twitter.com/RentelMe/")
                FormRowLinkView(icon: "link", color: Color.purple, text: "Instagram", link: "https://www.instagram.com/rentel.me/")
            }
            
//MARK: - Static
            Section() {
                FormRowStaticView(icon: "gear", firstText: "Application", secondText: "Rentel POS")
                FormRowStaticView(icon: "checkmark.seal", firstText: "Compatibility", secondText: "iOS, iPadOS")
                FormRowStaticView(icon: "dot.radiowaves.right", firstText: "Connectivity", secondText: "NFC Reader")
                FormRowStaticView(icon: "keyboard", firstText: "Developer", secondText: "Boris Zinovyev")
                FormRowStaticView(icon: "flag", firstText: "App Version", secondText: "1.0.0")
            }
        
//MARK: - Exit Button
            Button {isShowingAlert = true
                
            } label: {
                HStack{
                    ZStack {
                        RoundedRectangle(cornerRadius: 8, style: .continuous)
                            .fill(Color(.red))
                
                        Image(systemName: "person.crop.circle.badge.xmark")
                            .imageScale(.large)
                            .foregroundColor(Color.white)
                }
                            .frame(width: 36, height: 36, alignment: .center)
                
                        Text("Leave account")
                            .foregroundColor(Color.red)
                    
                Spacer()
            }
        }
            .alert("Are You Shure?", isPresented: $isShowingAlert) {
                Button("Log Out", role: .destructive)
                { action: do {try? Auth.auth().signOut()
                withAnimation{status = false}
            }
        }
            .buttonStyle(PlainButtonStyle())
    }
}
// MARK: - Footer
        Text("Copyright© All rights reserved. RENTEL LLC")
            .modifier(CopyrightModifier())
            .padding()
        }
// MARK: - View
    .navigationBarTitle("Settings", displayMode: .automatic)
    .background(Color("ColorBackground")
    .edgesIgnoringSafeArea(.all))
    }
}

