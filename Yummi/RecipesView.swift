//
//  IngredientsView.swift
//  Yummi
//
//  Created by Kwong, Andreas (IRG) on 23/02/2024.
//

import SwiftUI

struct RecipesView: View {
    @State var search: String = ""
    @State var recipes: [Recipe] = Recipe.recipeExamples
    @State var present = false
    @State var results: [Meal] = []
    @ObservedObject var apiManager = APIManager.shared
    var body: some View {
        NavigationStack {
            List {
                ForEach(Recipe.recipeExamples, id: \.rating) { recipes in
                    NavigationLink(destination: IndividualRecipe(recipe: recipes)) {
                        Text(recipes.isFavourite ? "⭐️" : "     ")
                        Text("\(recipes.name)")
                        }
                    }
                    .onChange(of: search) { oldValue, newValue in
//                        print("New value is: \(newValue)")
                        apiManager.searchFor(query: newValue) { results in
                            self.results = results
                        }
                    }
                Section ("API Results:") {
                    ForEach(results, id:\.idMeal) { result in
                        HStack{
                            AsyncImage(url: URL(string: result.strMealThumb)) { image in
                                image.resizable()
                            } placeholder: {
                                Color.gray
                            }
                            .frame(width: 128, height: 128)
                            .clipShape(.rect(cornerRadius:25))
                            NavigationLink("\(result.strMeal)") {
                                APIDetailedView(mealId: result.idMeal, mealStr: result.strMeal)
                            }
                        }

                    }
                }
                
            }
            .navigationTitle("Recipes")
            .sheet(isPresented: $present) {
                NewRecipeView(ingredients: Ingredient.examples)
            }
            .searchable(text: $search, isPresented: .constant(true))
            .toolbar {
                ToolbarItem(placement: .status) {
                    HStack {
                        Button {
                            present.toggle()
                        } label: {
                            HStack {
                                Image(systemName: "plus.app")
                                    .scaleEffect(1.4)
                                Text("Add New Recipe")
                            }
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    RecipesView()
}
