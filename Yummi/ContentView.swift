//
//  ContentView.swift
//  Yummi
//
//  Created by Kwong, Andreas (IRG) on 23/01/2024.
//

import SwiftUI

//func getDate(year: Int, month: Int, day: Int) -> Date {
//    return Calendar.current.date(from: DateComponents(calendar: Calendar.current, year: year, month: month, day: day))!
//}

struct ContentView: View {
    
    var body: some View {
        TabView {
            IngredientsView()
                .tabItem {
                    Image(systemName: "fork.knife.circle")
                    Text("Ingredients")
                }
            RecipesView()
                .tabItem {
                    Image(systemName: "book")
                    Text("Recipes")
                }
        }
    }
}


#Preview {
    ContentView()
}
