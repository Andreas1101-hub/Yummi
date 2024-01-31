//
//  ContentView.swift
//  Yummi
//
//  Created by Kwong, Andreas (IRG) on 23/01/2024.
//

import SwiftUI

func getDate(year: Int, month: Int, day: Int) -> Date {
    return Calendar.current.date(from: DateComponents(calendar: Calendar.current, year: year, month: month, day: day))!
}

struct ContentView: View {
    @State private var ingredientsList = allIngredient()
    @State private var selectedIngredient = 0 {
        didSet{
            if selectedIngredient > ingredientsList.allIngredients.count-1 {
                selectedIngredient = 0
            }
        }
    }
    @State private var newIngredientName = ""
    @State private var newQuantity = ""
    enum Unit: String, CaseIterable, Identifiable {
        case kg, teaspoons, ml
        var id: Self { self }
    }
    @State private var selectedUnit: Unit = .kg
    @State private var selectedCategory: Category = .Carbs
    @State private var newExpiryDate = Date()
    var body: some View {
        Form {
            Section {
                VStack(alignment: .leading, spacing: 20) {
                    Text("\(ingredientsList.allIngredients[selectedIngredient].displayStats())")
                    Button(action: {
                        selectedIngredient += 1
                    }) {
                        Label("Next Ingredient",systemImage: "capsule.inset.filled")
                    }
                }
            }
            Section {
                VStack(alignment: .leading, spacing: 20) {
                    TextField("Ingredient Name", text: $newIngredientName)
                    HStack {
                        TextField("Quantity", text: $newQuantity)
                        List {
                            Picker("", selection: $selectedUnit) {
                                Text("Kilogram").tag(Unit.kg)
                                Text("Tea Spoons").tag(Unit.teaspoons)
                                Text("Milliliter").tag(Unit.ml)
                            }
                        }
                    }
                    List {
                        Picker("Category", selection: $selectedCategory) {
                            Text("Fruits").tag(Category.Fruits)
                            Text("Meats").tag(Category.Meats)
                            Text("Carbs").tag(Category.Carbs)
                            Text("Dairy").tag(Category.Dairy)
                            Text("Vegetables").tag(Category.Vegetables)
                        }
                    }
                    DatePicker("Expiry Date", selection: $newExpiryDate)
                    Button(action: {
                        let tempIngredient = Ingredient(name: newIngredientName, quantity: newQuantity, unit: selectedUnit.rawValue, category: selectedCategory, expiryDate: getDate(year: 2025, month: 12, day: 5))
                        ingredientsList.allIngredients.append(tempIngredient)
                        print(ingredientsList.allIngredients)
                    }) {
                        Label("Add New Ingredient", systemImage: "checkmark.seal")
                    }
                }
            }
        }
    }
}


#Preview {
    ContentView()
}
