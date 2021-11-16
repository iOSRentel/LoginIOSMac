//
//  CardListViewModel.swift
//  LoginIOSMac (iOS)
//
//  Created by Boris Zinovyev on 16.11.2021.
//

import Combine

final class MenuListViewModel: ObservableObject {
    @Published var menuRepository = MenuRepository()
    @Published var menuViewModels: [MenuViewModel] = []
    
    private var cancellables: Set<AnyCancellable> = []
    
    init() {
        menuRepository.$menuCards
            .map { menuCards in
                menuCards.map(MenuViewModel.init)
            }
            .assign(to: \.menuViewModels, on: self)
            .store(in: &cancellables)
    }
    
//  Добавить : удалить карточку
    func add(_ menuCard: Menu) {
        menuRepository.add(menuCard)
    }
    func remove(_ menuCard: Menu) {
        menuRepository.remove(menuCard)
    }
    func update(_ menuCard: Menu) {
        menuRepository.update(menuCard)
    }
}
