//
//  APIResult.swift
//  Yummi
//
//  Created by Kwong, Andreas (IRG) on 07/06/2024.
//

import Foundation

struct APIResult: Codable {
    let meals: [Meal]
}

struct Meal: Codable {
    let idMeal: String
    let strMeal: String
    let strCategory: String
    let strArea: String
    let strTags: String
    let strYoutube: String
    let strInstructions: String
    let strMealThumb: String
}
