//
//  OrdersCartViewModel.swift
//  LoginIOSMac (iOS)
//
//  Created by Boris Zinovyev on 16.11.2021.
//

import SwiftUI

class OrdersCartViewModel: ObservableObject{
    
    @Published var items = [
        OrdersItem(name: "Super Burger", details: "Mixed with greese - olive oil and chips", image: "Burger", price: 20.99, quantity: 1, offset: 0, isSwipe: false),
        OrdersItem(name: "Pepperoni", details: "Mixed with greese - olive oil and chips", image: "Pepperoni", price: 25.69, quantity: 1, offset: 0, isSwipe: false),
        OrdersItem(name: "Quatroporte", details: "Mixed with greese - olive oil and chips", image: "Quatroporte", price: 22.99, quantity: 1, offset: 0, isSwipe: false),
        OrdersItem(name: "Fish & Chips", details: "Mixed with greese - olive oil and chips", image: "Fish & Chips", price: 15.2, quantity: 1, offset: 0, isSwipe: false),
        OrdersItem(name: "Cezar salad", details: "Mixed with greese - olive oil and chips", image: "Cezar salad", price: 29.02, quantity: 1, offset: 0, isSwipe: false),
    ]
}
