//
//  FirebaseRepository.swift
//  Coffee Shop SwiftUI
//
//  Created by Victor Carreno on 20/05/24.
//

import Foundation

final class FirebaseRepository {
    
    func fetchDrinks() async -> [Drink] {
        DummyData.drinks
    }
    
    func placeOrder(order: Order) {
        print("Place an order with id: \(order.id)")
        for item in order.items {
            print(item.name)
        }
    }
}
