//
//  OrdersItem.swift
//  LoginIOSMac (iOS)
//
//  Created by Boris Zinovyev on 16.11.2021.
//

import SwiftUI

struct OrdersItem: Identifiable {

    var id = UUID().uuidString
    var name : String
    var details : String
    var image : String
    var price : Float
    var quantity : Int
    var offset : CGFloat
    var isSwipe : Bool
}
