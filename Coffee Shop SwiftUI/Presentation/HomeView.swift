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
    @State private var isShowingDetail = false
    
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
                List(categories.keys.sorted(), 
                     id: \String.self) { key in
                    Section {
                        if let drinks = categories[key] {
                            ForEach(drinks) { drink in
                                DrinkRow(drink) {
                                    viewModel.selectDrink(drink: drink)
                                    isShowingDetail = true
                                }
                            }
                        }
                    } header: {
                        Text(key)
                            .font(.subheadline)
                    }
                }
                .navigationTitle("☕️ Home")
                .task(viewModel.fetchDrinks)
                .blur(radius: isShowingDetail ? 20 : 0)
                .disabled(isShowingDetail)
                /* this is the same way to call but the previos is more elegant
                 for this the fetchDrinks() functions needs to be marked as sendable
                .task {
                    viewModel.fetchDrinks()
                }
                */
            }
            if viewModel.selectedDrink != nil && isShowingDetail {
                DrinkDetailView(drink: viewModel.selectedDrink!,
                                isShowingDetail: $isShowingDetail)
            }
        }
    }
}


#Preview {
    HomeView()
}
