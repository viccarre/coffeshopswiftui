//
//  Drink.swift
//  Coffee Shop SwiftUI
//
//  Created by Victor Carreno on 15/05/24.
//

import Foundation

enum Category: String, Codable, Hashable{
    case hot, cold, softDrinks
}

// Codable because we want to save it to our firebase so we will be using automatically enconding and decoding
// Identifiable because is easier to work when we have out list

struct Drink: Codable, Identifiable {
    let id: String
    let name: String
    let description: String
    let imageLink: String
    let price: Double
    let category: Category
    
    var imageUrl: URL? {
        URL(string: imageLink)
    }
}
