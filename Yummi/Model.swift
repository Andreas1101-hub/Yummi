//
//  Model.swift
//  Yummi
//
//  Created by Kwong, Andreas (IRG) on 24/01/2024.
//

import Foundation

struct Ingredient {
    let name: String
    var quantity: Int
    var unit: String
    var category: Category
    var expiryDate: Date
    
    
    func displayStats() -> String {
        return """
Name: \(name)
Quantity: \(quantity) (unit)
Category: \(category)
Expiry Date: \(expiryDate)
"""
    }    
    
    
}

enum Category: String {
    case Fruits
    case Meats
    case Dairy
    case Vegetables
    case Carbs
}
