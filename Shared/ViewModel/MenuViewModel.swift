//
//  MenuViewModel.swift
//  LoginIOSMac (iOS)
//
//  Created by Boris Zinovyev on 16.11.2021.
//

import Combine

final class MenuViewModel: ObservableObject, Identifiable {
    private let menuRepository = MenuRepository()
    @Published var menuCard: Menu
    
    var id = ""
    
    private var cancellables: Set<AnyCancellable> = []
    
    init(menuCard: Menu) {
        self.menuCard = menuCard
        $menuCard
            .compactMap { $0.id }
            .assign(to: \.id, on: self)
            .store(in: &cancellables)
    }
}
