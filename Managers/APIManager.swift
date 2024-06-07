//
//  APIManager.swift
//  Yummi
//
//  Created by Kwong, Andreas (IRG) on 07/06/2024.
//

import Foundation

class APIManager: ObservableObject {
    
    static let shared = APIManager()
    
    private init() {}
    
    private let baseURL: String = "https://www.themealdb.com/api/json/v1/1"
    
    func searchFor(query: String, completion: @escaping ([Meal]) -> Void) {
        let query = "/search.php?s=\(query)"
        
        guard let url = URL(string: baseURL + query) else {
            print("Invalid URL")
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, responses, error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                return
            }
            
            let decoder = JSONDecoder()
            
            guard let data = data,
                  let result = try? decoder.decode(APIResult.self, from: data) else {
                print("Error decoding")
                return
            }
            
            completion(result.meals)
            
        }
        task.resume()
    }
}
