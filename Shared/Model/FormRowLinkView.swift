//
//  FormRowLinkView.swift
//  LoginIOSMac
//
//  Created by Boris Zinovyev on 13.11.2021.
//

import SwiftUI

struct FormRowLinkView: View {
// MARK: - PROPERTIES
    
    var icon: String
    var color: Color
    var text: String
    var link: String
// MARK: -
    
    var body: some View {
        HStack {
            ZStack {
                RoundedRectangle(cornerRadius: 8, style: .continuous)
                    .fill(color)
                
                    Image(systemName: icon)
                        .imageScale(.large)
                        .foregroundColor(Color.white)
            }
            .frame(width: 36, height: 36, alignment: .center)
            
            Text(text).foregroundColor(Color.gray)
            
            Spacer()
            
            Button(action: {
    // OPEN LINK
                guard let url = URL(string: self.link),
                      UIApplication.shared.canOpenURL(url) else {
                    return
                }
                UIApplication.shared.open(url as URL)
            }) {
                Image(systemName: "chevron.right")
                    .font(.system(size: 14, weight: .semibold, design: .rounded))
            }
            .accentColor(Color(.systemGray2))
            }
        }
    }
