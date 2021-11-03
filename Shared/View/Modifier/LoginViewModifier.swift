//
//  LoginViewModifier.swift
//  LoginIOSMac (iOS)
//
//  Created by Boris Zinovyev on 28.10.2021.
//

import SwiftUI

struct LoginViewModifier: ViewModifier {
    
    func body(content: Content) -> some View {

    return content
            .padding()
            .padding(.bottom)
            .background(Color("BGColor"))
            .padding(.vertical)
            .padding(.bottom,10)
            .padding(.horizontal,25)
    }
}
