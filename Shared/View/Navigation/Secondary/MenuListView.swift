//
//  MenuListView.swift
//  LoginIOSMac (iOS)
//
//  Created by Boris Zinovyev on 16.11.2021.
//

import SwiftUI

struct MenuListView: View {
    @ObservedObject var menuListViewModel: MenuListViewModel
    @State private var showingForm = false
    @State private var showPassed = false

    
    var body: some View {
//        NavigationView {

// Карточки
        VStack {
            Toggle(isOn: $showPassed) { Text("\(showPassed ? "Hide" : "Show") passed questions") }
                List {
                    ForEach(menuListViewModel.menuViewModels.filter {$0.menuCard.passed == showPassed }) {
                        menuVM in
                        MenuView(menuViewModel: menuVM)
                            .onLongPressGesture(minimumDuration: 1.0) {
                                var menuCard = menuVM.menuCard
                                menuCard.passed.toggle()
                                menuListViewModel.update(menuCard)
                        }
                    }.onDelete(perform: delete)
                }
                .listStyle(InsetListStyle())
            
            
// Кнопка добавить
            Button(action: {
                showingForm = true
            }) {
                Circle()
                    .fill(Color.green)
                    .frame(height: 60)
                    .overlay(Image(systemName: "plus").foregroundColor(.white))
            }.sheet(isPresented: $showingForm) {
                FormView { (menuCard) in
                    menuListViewModel.add(menuCard)
                    showingForm = false
                }
            }
        }
        .navigationTitle("Menu")

    }

//}
    
    private func delete(at offsets: IndexSet) {
        offsets.map { menuListViewModel.menuViewModels[$0].menuCard
        }.forEach(menuListViewModel.remove)
    }
}
