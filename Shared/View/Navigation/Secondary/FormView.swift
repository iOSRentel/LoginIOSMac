//
//  FormView.swift
//  LoginIOSMac (iOS)
//
//  Created by Boris Zinovyev on 16.11.2021.
//

import SwiftUI

struct FormView: View {
    @State private var question: String = ""
    @State private var answer: String = ""

    var didAddMenu: (_ menuCard: Menu) -> Void
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    TextField("Food", text: $question)
                    TextField("Price", text: $answer)
                }
                Button("Add to Menu") {
                    let menu = Menu(question: question, answer: answer)
                    didAddMenu(menu)
                }.disabled(question.isEmpty || answer.isEmpty).padding()
            }.navigationTitle("New product")
        }
    }
}
