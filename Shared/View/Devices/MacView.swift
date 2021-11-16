//
//  MacView.swift
//  MacView (macOS)
//
//  Created by Boris Zinovyev on 16.11.2021.
//

import SwiftUI
import Firebase

struct MacView: View {
    @AppStorage("log_Status") var status = false
    
    var body: some View {
        
        VStack(spacing: 20){
            Text("Logged Successfully")
                .font(.largeTitle)
                .fontWeight(.heavy)
            
            Button(action: {
// LogOut function
                try? Auth.auth().signOut()
                withAnimation{status = false}
            }, label: {
                Text("Log Out")
                    .fontWeight(.semibold)
                    .foregroundColor(Color("FontColor"))
                    .padding(.vertical, 12)
                    .padding(.horizontal, 30)
                    .background(Color.orange)
                    .cornerRadius(8)
            })
                .buttonStyle(PlainButtonStyle())
            
        }
//        .frame(width: homeData.ismacOS ? homeData.screen.width / 2 : nil,
//               height: homeData.screen.height / 2 : nil)
    }
}
