//
//  IndividualRecipe.swift
//  Yummi
//
//  Created by Kwong, Andreas (IRG) on 23/02/2024.
//

import SwiftUI

struct IndividualRecipe: View {
    @State var recipe: Recipe
    var body: some View {
        NavigationStack {
            List {
                Section("Ingredients") {
                    ForEach(recipe.ingredients, id:\.name) { ingredient in
                        Text("\(ingredient.name)")
                    }
                }
                Section("Rating and Favourite") {
                    Text("Rating: \(recipe.rating)")
                    HStack {
                        Text("Favourite: \(recipe.isFavourite ? "✅" : "❌")")
                        Toggle("", isOn: $recipe.isFavourite)
                    }
                }
            }
            .navigationTitle(recipe.name)
        }
    }
}
#Preview {
    IndividualRecipe(recipe: Recipe.recipeExamples[0])
}
