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
        List {
            Section {
                VStack(alignment: .leading, spacing: 20) {
                    Text("\(ingredientsList.allIngredients[selectedIngredient].displayStats())")
                    Button(action: {
                        selectedIngredient += 1
                    }) {
                        Label("Next Ingredient",systemImage: "button.programmable")
                    }
                }
            }
            Section {
                TextField("Ingredient Name", text: $newIngredientName)
                HStack {
                    TextField("Quantity", text: $newQuantity)
                        .keyboardType(.numberPad)
                    Picker("", selection: $selectedUnit) {
                        Text("Kilogram").tag(Unit.kg)
                        Text("Tea Spoons").tag(Unit.teaspoons)
                        Text("Milliliter").tag(Unit.ml)
                    }
                }
                Picker("Category", selection: $selectedCategory) {
                    Text("Fruits").tag(Category.Fruits)
                    Text("Meats").tag(Category.Meats)
                    Text("Carbs").tag(Category.Carbs)
                    Text("Dairy").tag(Category.Dairy)
                    Text("Vegetables").tag(Category.Vegetables)
                }
                DatePicker("Expiry Date", selection: $newExpiryDate, displayedComponents: [.date])
                Button(action: {
                    let tempIngredient = Ingredient(name: newIngredientName, quantity: newQuantity, unit: selectedUnit.rawValue, category: selectedCategory, expiryDate: newExpiryDate)
                    ingredientsList.allIngredients.append(tempIngredient)
                    newIngredientName = ""
                    newQuantity = ""
                }) {
                    Label("Add New Ingredient", systemImage: "square.and.pencil")
                }
            }
        }
    }
}


#Preview {
    ContentView()
}
