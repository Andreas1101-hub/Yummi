//
//  NewRecipeViewModel.swift
//  Yummi
//
//  Created by Kwong, Andreas (IRG) on 01/03/2024.
//

import Foundation

class NewRecipeViewModel: ObservableObject {
    static let shared = NewRecipeViewModel()
    private init() {}
    
    @Published var recipes: [Recipe] = Recipe.recipeExamples
}
