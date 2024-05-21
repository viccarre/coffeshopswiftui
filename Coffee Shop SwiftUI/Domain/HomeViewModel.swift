//
//  HomeViewModel.swift
//  Coffee Shop SwiftUI
//
//  Created by Victor Carreno on 20/05/24.
//

import Foundation

final class HomeViewModel: ObservableObject {
    
    @Published private(set) var drinks: [Drink] = []
    @Published private(set) var selectedDrink: Drink?
    
    func fetchDrinks() async {
        do {
            drinks = try await
        } catch {
            print("Error fetching drinks ", error.localizedDescription)
        }
    }
    
    func selectDrink(drink: Drink) {
        selectedDrink = drink
    }
}
