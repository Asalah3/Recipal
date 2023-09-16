//
//  CoreDataManager.swift
//  Recipal
//
//  Created by Asalah Sayed on 16/09/2023.
//

import Foundation
import CoreData

class CoreDataManager{
    func createFavouriteRecipe(context: NSManagedObjectContext, favouriteRecipe : Result){
        let recipe = FavouriteRecipe(context: context)
        recipe.favouriteId = favouriteRecipe.id as? NSDecimalNumber
        recipe.favouriteName = favouriteRecipe.name
        recipe.favouriteImage = favouriteRecipe.thumbnail_url
        recipe.favouriteServings = "\(favouriteRecipe.numServings ?? 0)"
        recipe.favouriteMealCheif = favouriteRecipe.description
        recipe.favouriteMealType = favouriteRecipe.slug
        saveFavouriteRecipe(context: context)
    }
    
    func deleteRecipeByName(context: NSManagedObjectContext, favouriteName : String){
        var favouriteItem : FavouriteRecipe?
        var favouritesList : [FavouriteRecipe]?
        favouritesList = getAllFavouriteRecipes(context: context)
        favouritesList?.forEach{item in
            if item.favouriteName  == favouriteName{
               favouriteItem = item
                do {
                    context.delete(favouriteItem ?? FavouriteRecipe())
                    try context.save()
                } catch {
                    print("Failed")
                    
                }
            }
        }
    }
    
    func saveFavouriteRecipe(context: NSManagedObjectContext){
        do{
            try context.save()
        }catch {
            print(error)
        }
    }
    
    func getAllFavouriteRecipes(context: NSManagedObjectContext) ->[FavouriteRecipe]{
        let request = FavouriteRecipe.fetchRequest()
        do{
            return try context.fetch(request)
        }catch {
            return []
        }
    }
    
    func checkIfRecipeInserted(favouriteName : String ,context: NSManagedObjectContext) -> Bool{
        var result = false
        let fetchedFavouriteList = getAllFavouriteRecipes(context: context)
        fetchedFavouriteList.forEach{item in
            if item.favouriteName  == favouriteName{
                result = true
            }
        }
        return result
    }
}
