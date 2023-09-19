//
//  NetworkService.swift
//  Recipal
//
//  Created by Soha Ahmed Hamdy on 02/01/2022.
//

import Foundation
protocol NetworkServicesProtocol {
    func fetchHomeCategoriesData(tag: String,compilitionHandler : @escaping (Categories?)-> Void)
    func fetchReceipeDetails(receipeId: Int, compilitionHandler: @escaping (Meal?) -> Void)
    func fetchSimilaritiesRecipe(receipeId: Int, compilitionHandler: @escaping (SimilaritiesRecipe?) -> Void)
}
class NetworkServices : NetworkServicesProtocol{
     func fetchHomeCategoriesData(tag: String, compilitionHandler: @escaping (Categories?) -> Void) {
        let url = URL(string: "https://tasty.p.rapidapi.com/recipes/list?from=0&size=20&tags=\(tag)")
    
        guard let newUrl = url else {
            return
        }
        var request = URLRequest(url: newUrl)
        request.allHTTPHeaderFields = ["X-RapidAPI-Host":"tasty.p.rapidapi.com",
                                       "X-RapidAPI-Key":"9cb882b063msh162ecccb7291936p15a97cjsn5ac2c6c27b75"]

        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: request){ data,response , error in
            do{
                let result = try JSONDecoder().decode(Categories.self, from: data ?? Data())
                compilitionHandler(result)
                print("sucsses ")
            } catch let error{
                print(error)
                compilitionHandler(nil)
                print("fail ")
            }
        }
        task.resume()
    }
    
    func fetchReceipeDetails(receipeId: Int, compilitionHandler: @escaping (Meal?) -> Void) {
       let url = URL(string: "https://tasty.p.rapidapi.com/recipes/get-more-info?id=\(receipeId)")
       guard let newUrl = url else {
           return
       }
       var request = URLRequest(url: newUrl)
       request.allHTTPHeaderFields = ["X-RapidAPI-Host":"tasty.p.rapidapi.com",
                                      "X-RapidAPI-Key":"edbcf0896dmsh5514fb8536977c7p1b9dd6jsn19b1cc27fd71"]
       
       let session = URLSession(configuration: .default)
       let task = session.dataTask(with: request){ data,response , error in
           do{
               let result = try JSONDecoder().decode(Meal.self, from: data ?? Data())
               compilitionHandler(result)
               print("sucsses in details")
           } catch let error{
               print(error)
               compilitionHandler(nil)
               print("fail in details")
           }
           
       }
       task.resume()
       
   }
   func fetchSimilaritiesRecipe(receipeId: Int, compilitionHandler: @escaping (SimilaritiesRecipe?) -> Void) {
       let url = URL(string: "https://tasty.p.rapidapi.com/recipes/list-similarities?recipe_id=\(receipeId)")
       guard let newUrl = url else {
           return
       }
       var request = URLRequest(url: newUrl)
       request.allHTTPHeaderFields = ["X-RapidAPI-Host":"tasty.p.rapidapi.com",
                                      "X-RapidAPI-Key":"edbcf0896dmsh5514fb8536977c7p1b9dd6jsn19b1cc27fd71"]
       let session = URLSession(configuration: .default)
       let task = session.dataTask(with: request){ data,response , error in
           do{
               let result = try JSONDecoder().decode(SimilaritiesRecipe.self, from: data ?? Data())
               compilitionHandler(result)
               print("sucsses in similar ")
           } catch let error{
               print(error)
               compilitionHandler(nil)
               print("fail in similar")
           }
       }
       task.resume()
       
   }
    
}

