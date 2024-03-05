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
    @State private var values = 0
    let step = 1
    let range = 1...10
    var body: some View {
        List {
            HStack (spacing: 0) {
                Text("No. Ingredients: \(values)")
                Stepper (
                    value: $values,
                    in: range,
                    step: step
                ) {}
            }
            ForEach(1 ..< values) {_ in 
                Picker("Ingredients", selection: $selectedIngredient) {
                    ForEach(ingredients, id: \.self.name) { ingredient in
                        Text(ingredient.name).tag(ingredient)
                    }
                }
            }
            
        }
    }
}

#Preview {
    NewRecipeView(ingredients: Ingredient.examples)
}
