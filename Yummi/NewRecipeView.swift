//
//  NewRecipeView.swift
//  Yummi
//
//  Created by Kwong, Andreas (IRG) on 01/03/2024.
//

import SwiftUI

struct NewRecipeView: View {
    @State var Ingredient: Ingredient
    var body: some View {
        List {
            Picker("Ingredients", selection: Ingredient.examples[0]) {
                ForEach(Ingredient.examples, id: \.self.name) (ingredient in
                    Text(ingredient.name).tag(Ingredient.examples)
                )
            }
        }
    }
}

#Preview {
    NewRecipeView()
}
