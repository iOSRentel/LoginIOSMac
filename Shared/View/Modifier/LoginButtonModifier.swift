//
//  LoginButtonModifier.swift
//  LoginIOSMac (iOS)
//
//  Created by Boris Zinovyev on 28.10.2021.
//

import SwiftUI

struct LoginButtonModifier: ViewModifier {
    func body(content: Content) -> some View {
        
        return content
            .aspectRatio(contentMode: .fit)
            .frame(width: 20, height: 20)
            .foregroundColor(Color("FontColor2"))
            .padding(12)
            .background(Color("AppleColor")
            )
        .clipShape(Circle())
    }
}
