//
//  MenuView.swift
//  LoginIOSMac (iOS)
//
//  Created by Boris Zinovyev on 16.11.2021.
//

import Foundation
import SwiftUI

struct MenuView: View {
    
    @State private var flipped = false
    
    var menuViewModel: MenuViewModel
    
    var body: some View {
        RoundedRectangle(cornerRadius: 6)
            .fill(flipped ? Color.white : Color.purple)
            .frame(height: 120)
            .overlay(
                ZStack {
                    HStack {
                        Spacer()
                            VStack {
                                Image(systemName: menuViewModel.menuCard.passed ? "star.fill" : "star")
                             Spacer()
                            }
                    }
                    Text(flipped ? menuViewModel.menuCard.answer : menuViewModel.menuCard.question)
                        .foregroundColor(flipped ? Color.black : Color.white)
                        .font(.custom("Avenir", size: 24))
                }.padding()
            )
            .onTapGesture {
                withAnimation {
                    flipped.toggle()
            }
        }
    }
}
