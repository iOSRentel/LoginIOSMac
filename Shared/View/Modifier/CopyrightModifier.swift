//
//  CopyrightModifier.swift
//  LoginIOSMac
//
//  Created by Boris Zinovyev on 12.11.2021.
//

import SwiftUI

struct CopyrightModifier: ViewModifier {
    func body(content: Content) -> some View {
        Text("CopyrightÂ© All rights reserved. RENTEL LLC")
//            .multilineTextAlignment(.center)
            .font(.footnote)
            .foregroundColor(Color("FontColor"))
    }
}
