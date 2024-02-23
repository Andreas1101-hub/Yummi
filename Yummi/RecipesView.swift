//
//  IngredientsView.swift
//  Yummi
//
//  Created by Kwong, Andreas (IRG) on 23/02/2024.
//

import SwiftUI

struct RecipesView: View {
    @State var isFavourite: Bool = false
    var body: some View {
        NavigationStack {
            List {
                ForEach(Recipe.recipeExamples, id: \.name) { recipes in
                    NavigationLink(destination: IndividualRecipe(recipe: recipes)) {
                        Button {
                            isFavourite.toggle()
                        } label: {
                            Text(isFavourite ? "star.fill" : "⭐️")
                        }
                        Text("\(recipes.name)")
                    }
                }
                .navigationTitle("Recipes")
            }
        }
    }
}

#Preview {
    RecipesView()
}
