//
//  HomeViewModel.swift
//  Coffee Shop SwiftUI
//
//  Created by Victor Carreno on 20/05/24.
//

import Foundation

final class HomeViewModel: ObservableObject {
    
    // For real life applications you should always use a dependency injection so you can pass any type of Repository as long
    // It conforms to some kind of protocols and will be easier for unit testing
    // to keep it simple we are going to create our firebase repository here
    private let firebaseRepository = FirebaseRepository()
    
    @Published private(set) var drinks: [Drink] = []
    @Published private(set) var selectedDrink: Drink?
    
    // @MainActor
    func fetchDrinks() async {
        do {
            drinks = try await firebaseRepository.fetchDrinks()
        } catch {
            print("Error fetching drinks ", error.localizedDescription)
        }
    }
    
    func selectDrink(drink: Drink) {
        selectedDrink = drink
    }
}
