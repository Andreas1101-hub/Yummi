//
//  Model.swift
//  Yummi
//
//  Created by Kwong, Andreas (IRG) on 24/01/2024.
//

import Foundation

struct Ingredient {
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
    
    
}

enum Category: String, CaseIterable, Identifiable {
    case Fruits
    case Meats
    case Dairy
    case Vegetables
    case Carbs
    var id: Self { self }
}

struct allIngredient {
    var allIngredients = [Ingredient(name: "Apple", quantity: "5", unit: "kg", category: .Fruits, expiryDate: getDate(year: 2025, month: 12, day: 5)),
                          Ingredient(name: "Orange", quantity: "4", unit: "kg", category: .Fruits, expiryDate: getDate(year: 2025, month: 12, day: 6)),
                          Ingredient(name: "Bread", quantity: "25", unit: "kg", category: .Carbs, expiryDate: getDate(year: 2024, month: 02, day: 19))]
}
