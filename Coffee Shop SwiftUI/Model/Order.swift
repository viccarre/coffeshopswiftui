//
//  Oder.swift
//  Coffee Shop SwiftUI
//
//  Created by Victor Carreno on 20/05/24.
//

import Foundation

struct Order: Codable {
    let id: String
    let customerName: String
    let customerAddress: String
    let customerMobile: String
    let items: [Drink]
    let orderTotal: Double
}
