//
//  ProfileInfo.swift
//  LoginIOSMac
//
//  Created by Boris Zinovyev on 15.11.2021.
//

import SwiftUI

struct ProfileInfo: View {
    
    var body: some View {
        
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
}

