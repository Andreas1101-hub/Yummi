//
//  Model.swift
//  Yummi
//
//  Created by Kwong, Andreas (IRG) on 24/01/2024.
//

import Foundation

struct Ingredient: Hashable, Identifiable {
    let id = UUID()
    let name: String
    var quantity: String
    var unit: String
    var category: Category
    var expiryDate: Date
    
    
    func displayStats() -> String {
        return """
Name: \(name)
Quantity: \(quantity) \(unit)
Category: \(category)
Expiry Date: \(expiryDate.formatted(date: .abbreviated, time: .omitted))
"""
    }    
    
    #if DEBUG
    static let examples = [
          Ingredient(name: "Apple", quantity: "5", unit: "kg", category: .Fruits, expiryDate: getDate(year: 2025, month: 12, day: 5)),
          Ingredient(name: "Orange", quantity: "4", unit: "kg", category: .Fruits, expiryDate: getDate(year: 2025, month: 12, day: 6)),
          Ingredient(name: "Bread", quantity: "25", unit: "kg", category: .Carbs, expiryDate: getDate(year: 2024, month: 02, day: 19)),
          Ingredient(name: "Flour", quantity: "8", unit: "tsp", category: .Carbs, expiryDate: getDate(year: 2026, month: 04, day: 21)),
          Ingredient(name: "Egg", quantity: "6", unit: "kg", category: .Dairy, expiryDate: getDate(year: 2024, month: 02, day: 27)),
          Ingredient(name: "Butter", quantity: "2", unit: "kg", category: .Dairy, expiryDate: getDate(year: 2025, month: 03, day: 01)),
          Ingredient(name: "Sugar", quantity: "20", unit: "tsp", category: .Confectionary, expiryDate: getDate(year: 2025, month: 08, day: 19)),
          Ingredient(name: "Salt", quantity: "5", unit: "tsp", category: .Condiments, expiryDate: getDate(year: 2028, month: 09, day: 22)),
          Ingredient(name: "Steak", quantity: "3", unit: "kg", category: .Meats, expiryDate: getDate(year: 2024, month: 03, day: 12)),
          Ingredient(name: "Rice", quantity: "8", unit: "kg", category: .Carbs, expiryDate: getDate(year: 2026, month: 05, day: 11))
    ]
    #endif
}

enum Category: String, CaseIterable, Identifiable {
    case Fruits
    case Meats
    case Dairy
    case Vegetables
    case Carbs
    case Confectionary
    case Condiments
    var id: Self { self }
}

struct allIngredient {
    var allIngredients = [Ingredient(name: "Apple", quantity: "5", unit: "kg", category: .Fruits, expiryDate: getDate(year: 2025, month: 12, day: 5)),
                          Ingredient(name: "Orange", quantity: "4", unit: "kg", category: .Fruits, expiryDate: getDate(year: 2025, month: 12, day: 6)),
                          Ingredient(name: "Bread", quantity: "25", unit: "kg", category: .Carbs, expiryDate: getDate(year: 2024, month: 02, day: 19)),
                          Ingredient(name: "Flour", quantity: "8", unit: "tsp", category: .Carbs, expiryDate: getDate(year: 2026, month: 04, day: 21)),
                          Ingredient(name: "Egg", quantity: "6", unit: "kg", category: .Dairy, expiryDate: getDate(year: 2024, month: 02, day: 27)),
                          Ingredient(name: "Butter", quantity: "2", unit: "kg", category: .Dairy, expiryDate: getDate(year: 2025, month: 03, day: 01)),
                          Ingredient(name: "Sugar", quantity: "20", unit: "tsp", category: .Confectionary, expiryDate: getDate(year: 2025, month: 08, day: 19)),
                          Ingredient(name: "Salt", quantity: "5", unit: "tsp", category: .Condiments, expiryDate: getDate(year: 2028, month: 09, day: 22)),
                          Ingredient(name: "Steak", quantity: "3", unit: "kg", category: .Meats, expiryDate: getDate(year: 2024, month: 03, day: 12)),
                          Ingredient(name: "Rice", quantity: "8", unit: "kg", category: .Carbs, expiryDate: getDate(year: 2026, month: 05, day: 11))]
}

struct Recipe {
    let name: String
    let ingredients: [Ingredient]
    var isFavourite: Bool
    var rating: Int
    
    var displayInfo: String {
        """
        Name: \(self.name)
        Favourite\(self.isFavourite)
        Rating\(self.rating)
        """
    }

    
    #if DEBUG
    static var recipeExamples: [Recipe] = [Recipe(name: "Cake 🎂", ingredients: [Ingredient.examples[3], Ingredient.examples[4], Ingredient.examples[5], Ingredient.examples[6]], isFavourite: false, rating: 8), Recipe(name: "Fried Rice 🍛", ingredients: [Ingredient.examples[5], Ingredient.examples[9]], isFavourite: true, rating: 10)]
    #endif
}
