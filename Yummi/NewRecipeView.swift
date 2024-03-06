//
//  NewRecipeView.swift
//  Yummi
//
//  Created by Kwong, Andreas (IRG) on 01/03/2024.
//

import SwiftUI

struct NewRecipeView: View {
//    @ObservableObject var shared = NewRecipeViewModel.shared
    @State var ingredients: [Ingredient]
    @State var selectedIngredient: Ingredient = Ingredient.examples[0]
    @State private var multiSelection = Set<UUID>()
    var body: some View {
        NavigationStack {
            VStack {
                List(ingredients, id: \.self.name, selection: $multiSelection) { ingredient in
                    Text(ingredient.name)
                }
                Text("\(multiSelection.count) selections")
            }
            .navigationTitle("New Recipes")
            .toolbar { EditButton() }
        }
        
    }
}

#Preview {
    NewRecipeView(ingredients: Ingredient.examples)
}

//            Picker("Ingredients", selection: $selectedIngredient) {
//                ForEach(ingredients, id: \.self.name) { ingredient in
//                    Text(ingredient.name).tag(ingredient)
//                }
//            }
