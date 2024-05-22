//
//  ContentView.swift
//  Coffee Shop SwiftUI
//
//  Created by Victor Carreno on 15/05/24.
//

import SwiftUI
import SwiftData

struct HomeView: View {
    
    @StateObject private var viewModel = HomeViewModel()
    @State private var isShowing = false
    
    var categories: [String: [Drink]] {
        .init(
            grouping: viewModel.drinks,
            by: { $0.category.rawValue }
        )
    }
    
    var body: some View {
        ZStack {
            NavigationStack{
                //List(viewModel.drinks) { drink in
                //  Text(drink.name)
                List(categories.keys.sorted(), id: \String.self) { key in
                    Section {
                        if let drinks = categories[key] {
                            ForEach(drinks) { drink in
                                Text(drink.name)
                            }
                        }
                    } header: {
                        Text(key)
                            .font(.subheadline)
                    }
                }
                .navigationTitle("☕️ Home")
                .task(viewModel.fetchDrinks)
                /* this is the same way to call but the previos is more elegant
                .task {
                    viewModel.fetchDrinks()
                }
                */
            }
        }
    }
}


#Preview {
    HomeView()
}
