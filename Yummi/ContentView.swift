//
//  ContentView.swift
//  Yummi
//
//  Created by Kwong, Andreas (IRG) on 23/01/2024.
//

import SwiftUI

func getDate(year: Int, month: Int, day: Int) -> Date {
    return Calendar.current.date(from: DateComponents(calendar: Calendar.current, year: year, month: month, day: day))!
}

struct ContentView: View {
    @State private var ingredientsList = allIngredient()
    @State private var selectedIngredient = 0 {
        didSet{
            if selectedIngredient > ingredientsList.allIngredients.count-1 {
                selectedIngredient = 0
            }
        }
    }
    @State private var newIngredientName = ""
    var body: some View {
        Form {
            Section {
                VStack(alignment: .leading, spacing: 20) {
                    Text("\(ingredientsList.allIngredients[selectedIngredient].displayStats())")
                    Button("Next Ingredient", action: {
                        selectedIngredient += 1
                    })
                }
            }
            Section {
                VStack(alignment: .leading, spacing: 20) {
                    TextField("Ingredient Name", text: $newIngredientName)
                }
            }
        }
    }
}


#Preview {
    ContentView()
}
