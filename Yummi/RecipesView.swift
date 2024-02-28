//
//  IngredientsView.swift
//  Yummi
//
//  Created by Kwong, Andreas (IRG) on 23/02/2024.
//

import SwiftUI

struct RecipesView: View {
    
    @State var recipes: [Recipe] = Recipe.recipeExamples
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(Recipe.recipeExamples, id: \.rating) { recipes in
                    NavigationLink(destination: IndividualRecipe(recipe: recipes)) {
                        Text(recipes.isFavourite ? "⭐️" : "     ")
                        Text("\(recipes.name)")
                    }
                }
            }
            .navigationTitle("Recipes")
        }
    }
}

#Preview {
    RecipesView()
}
