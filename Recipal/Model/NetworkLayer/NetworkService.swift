//
//  NetworkService.swift
//  Recipal
//
//  Created by Soha Ahmed Hamdy on 02/01/2022.
//

import Foundation
import Combine

protocol NetworkServicesProtocol {
    func fetchHomeCategoriesData(tag: String) -> AnyPublisher<Categories, Error>?
    func fetchReceipeDetails(receipeId: Int) -> AnyPublisher<Meal, Error>?
    func fetchSimilaritiesRecipe(receipeId: Int) -> AnyPublisher<SimilaritiesRecipe, Error>?
}

class NetworkServices : NetworkServicesProtocol{
     func fetchHomeCategoriesData(tag: String) -> AnyPublisher<Categories, Error>? {
        let url = URL(string: "https://tasty.p.rapidapi.com/recipes/list?from=0&size=20&tags=\(tag)")
    
        guard let newUrl = url else {
            return nil
        }
        var request = URLRequest(url: newUrl)
        request.allHTTPHeaderFields = ["X-RapidAPI-Host":"tasty.p.rapidapi.com",
                                       "X-RapidAPI-Key":"03cffd8469mshc76a65413830c99p15fb9bjsn35761dd68b13"]

         let session = URLSession.shared
        let task = session.dataTaskPublisher(for: request)
             .map(\.data)
             .decode(type: Categories.self, decoder: JSONDecoder())
             .eraseToAnyPublisher()
         
        return task
    }
    
    func fetchReceipeDetails(receipeId: Int) -> AnyPublisher<Meal, Error>? {
       let url = URL(string: "https://tasty.p.rapidapi.com/recipes/get-more-info?id=\(receipeId)")
       guard let newUrl = url else {
           return nil
       }
       var request = URLRequest(url: newUrl)
       request.allHTTPHeaderFields = ["X-RapidAPI-Host":"tasty.p.rapidapi.com",
                                      "X-RapidAPI-Key":"edbcf0896dmsh5514fb8536977c7p1b9dd6jsn19b1cc27fd71"]
       
        let session = URLSession.shared
       let task = session.dataTaskPublisher(for: request)
            .map(\.data)
            .decode(type: Meal.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
        
        return task
    }
    
    
   func fetchSimilaritiesRecipe(receipeId: Int) -> AnyPublisher<SimilaritiesRecipe, Error>? {
       let url = URL(string: "https://tasty.p.rapidapi.com/recipes/list-similarities?recipe_id=\(receipeId)")
       guard let newUrl = url else {
           return nil
       }
       var request = URLRequest(url: newUrl)
       request.allHTTPHeaderFields = ["X-RapidAPI-Host":"tasty.p.rapidapi.com",
                                      "X-RapidAPI-Key":"edbcf0896dmsh5514fb8536977c7p1b9dd6jsn19b1cc27fd71"]
       let session = URLSession.shared
       let task = session.dataTaskPublisher(for: request)
           .map(\.data)
           .decode(type: SimilaritiesRecipe.self, decoder: JSONDecoder())
           .eraseToAnyPublisher()
       return task
   }
    
}

