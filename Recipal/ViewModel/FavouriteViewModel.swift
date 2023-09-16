//
//  FavouriteViewModel.swift
//  Recipal
//
//  Created by Asalah Sayed on 16/09/2023.
//

import Foundation
import CoreData
import Combine
import SwiftUI
class FavouriteViewModel : ObservableObject{

    var coreDataManager = CoreDataManager()
    func createFavouriteRecipe(context: NSManagedObjectContext, favouriteRecipe : Result){
        coreDataManager.createFavouriteRecipe(context: context, favouriteRecipe: favouriteRecipe)
    }
    
    
    func getAllFavouriteRecipes(context: NSManagedObjectContext) ->[FavouriteRecipe]{
        return coreDataManager.getAllFavouriteRecipes(context: context)
    }
    
    func checkIfRecipeInserted(favouriteName : String ,context: NSManagedObjectContext) -> Bool{
        return coreDataManager.checkIfRecipeInserted(favouriteName: favouriteName, context: context)
    }
    func deleteFavouriteRecipeByName(favouriteName : String ,context: NSManagedObjectContext) {
        coreDataManager.deleteRecipeByName(context: context, favouriteName: favouriteName)
    }
}
