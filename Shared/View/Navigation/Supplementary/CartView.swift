//
//  OrdersView.swift
//  LoginIOSMac
//
//  Created by Boris Zinovyev on 14.11.2021.
//

import SwiftUI

struct CartView: View {

    @StateObject var cardData = OrdersCartViewModel()
    @State private var myCart = false
    var body: some View {
        
        VStack{
            
            ScrollView(.vertical, showsIndicators: false){
                
                LazyVStack(spacing:0) {
                    ForEach(cardData.items) {Item in
//  ItemsView
                        ItemsView(item: $cardData.items[getIndex(item: Item)])
                    }
                }
            }
//  BottomView
            VStack{
                HStack{
                    Text("Total")
                        .fontWeight(.heavy)
                        .foregroundColor(.gray)
                    
                    Spacer()
                    
//MARK: калькулятор
                    Text(calculateTotalPrice())
                        .font(.title)
                        .fontWeight(.heavy)
                        .foregroundColor(.black)
                    
                }
                .padding([.top, .horizontal])
                
                Button(action: {}) {
                    Text("Check out")
                        .font(.title2)
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width - 30)
                        .background(Color.blue)
                        .cornerRadius(15)
                }
            }
        }
        .navigationTitle("MyCart")
//        .navigationBarHidden(true)
        .background((Color.white).ignoresSafeArea())
    }
    func getIndex(item: OrdersItem)->Int{
        return cardData.items.firstIndex { (item1) -> Bool in
        return item.id == item1.id
        } ?? 0
    }
    func calculateTotalPrice()->String{
        var price : Float = 0
        
        cardData.items.forEach { (item) in
            price += Float(item.quantity) * item.price
        }
        return getPrice(value: price)
    }
}

