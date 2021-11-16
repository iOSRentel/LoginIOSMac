//
//  ItemsView.swift
//  LoginIOSMac (macOS)
//
//  Created by Boris Zinovyev on 16.11.2021.
//

import SwiftUI

struct ItemsView: View {
    
    @Binding var item: OrdersItem
    
    var body: some View {
        HStack(spacing: 15){
            Image(item.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 130, height: 130)
                .cornerRadius(15)
            
            VStack(alignment: .leading, spacing: 10) {
                
                Text(item.name)
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
                
                Text(item.details)
                    .fontWeight(.semibold)
                    .foregroundColor(.gray)
                
                HStack(spacing: 15) {
                    
                    Text(getPrice(value: Float(item.price)))
                    .font(.title2)
                    .fontWeight(.heavy)
                    .foregroundColor(.black)
                    
                    Spacer(minLength: 0)
                    
//MARK: -  Plus : Minus
                    Button(action: {
                        if item.quantity > 1{item.quantity -= 1} }) {
                            Image(systemName: "minus")
                                .font(.system(size: 16, weight: .heavy))
                                .foregroundColor(.black)
                        }
                    Text("\(item.quantity)")
                        .fontWeight(.heavy)
                        .foregroundColor(.black)
                        .padding(.vertical, 5)
                        .padding(.horizontal, 10)
                        .background(Color.black.opacity(0.06))
                        .clipShape(Circle())

                    Button(action: {item.quantity += 1}) {

                        Image(systemName: "plus")
                            .font(.system(size: 16, weight: .heavy))
                            .foregroundColor(.black)
                    }
                }
            }
        }
        .padding()
    }
}

//MARK: фиксим цену
func getPrice(value: Float)->String{
    let format = NumberFormatter()
    format.numberStyle = .currency
    
    return format.string(from: NSNumber(value: value)) ?? ""
}
