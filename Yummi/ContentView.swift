//
//  ContentView.swift
//  Yummi
//
//  Created by Kwong, Andreas (IRG) on 23/01/2024.
//

import SwiftUI

struct ContentView: View {
    let ingredients = Ingredient(name: "Apple", quantity: 5, unit: "kg", category: .Fruits, expiryDate: Date.distantFuture)
    var body: some View {
        VStack {
            Text("\(ingredients.displayStats())")

        }
        .padding()
    }
}


#Preview {
    ContentView()
}
