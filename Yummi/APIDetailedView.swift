//
//  APIDetailedView.swift
//  Yummi
//
//  Created by Kwong, Andreas (IRG) on 07/06/2024.
//

import SwiftUI

struct APIDetailedView: View {
    
    @State var mealId: String = ""
    @State var mealStr: String = ""
    @State private var results: [Meal] = []
    @ObservedObject var apiManager = APIManager.shared
    
    var body: some View {
        VStack{
            ForEach(results, id:\.idMeal) { result in
                List {
                    Text("Category: \(result.strCategory)")
                    Text("Region: \(result.strArea)")
                    Text("Tags: \(result.strTags)")
                    Text("Youtube Tutorial: \(result.strYoutube)")
                    Text("Instructions: \(result.strInstructions)")
                }
                
                
            }
        }
        .navigationTitle(mealStr)
        .onAppear {
            apiManager.searchFor(query: mealStr) { results in
                self.results = results
            }
        }

    }
}

#Preview {
    APIDetailedView()
}
