//
//  ContentView.swift
//  Yummi
//
//  Created by Kwong, Andreas (IRG) on 23/01/2024.
//

import SwiftUI

//func getDate(year: Int, month: Int, day: Int) -> Date {
//    return Calendar.current.date(from: DateComponents(calendar: Calendar.current, year: year, month: month, day: day))!
//}

struct ContentView: View {
//    @State private var ingredientsList = allIngredient()
//    @State private var selectedIngredient = 0 {
//        didSet{
//            if selectedIngredient > ingredientsList.allIngredients.count-1 {
//                selectedIngredient = 0
//            }
//        }
//    }
//    @State private var newIngredientName = ""
//    @State private var newQuantity = ""
//    enum Unit: String, CaseIterable, Identifiable {
//        case kg, teaspoons, ml
//        var id: Self { self }
//    }
//    @State private var selectedUnit: Unit = .kg
//    @State private var selectedCategory: Category = .Carbs
//    @State private var newExpiryDate = Date()
//    
//    @State private var value = 0
//    let step = 1
//    let range = 1...50
    var body: some View {
        TabView {
            IngredientsView()
                .tabItem {
                    Image(systemName: "fork.knife.circle")
                    Text("Ingredients")
                }
            RecipesView()
                .tabItem {
                    Image(systemName: "book")
                    Text("Recipes")
                }
        }
    }
}


#Preview {
    ContentView()
}
