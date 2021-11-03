//
//  ProgressView.swift
//  LoginIOSMac
//
//  Created by Boris Zinovyev on 03.11.2021.
//

import SwiftUI
struct LoadingView: View {
    var body: some View {

        ZStack {
            Color.white.opacity(0.23)

            LoadingView()
                .frame(width: 70, height: 70)
                .background(Color("BGColor"))
                .cornerRadius(10)
//     цвет индикатора
                .colorScheme(.light)
        }
        .ignoresSafeArea()
    }
}
