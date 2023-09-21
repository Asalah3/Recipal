//
//  FavouriteRecipe+CoreDataProperties.swift
//  Recipal
//
//  Created by Asalah Sayed on 21/09/2023.
//
//

import Foundation
import CoreData


extension FavouriteRecipe {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<FavouriteRecipe> {
        return NSFetchRequest<FavouriteRecipe>(entityName: "FavouriteRecipe")
    }

    @NSManaged public var favouriteId: String?
    @NSManaged public var favouriteImage: String?
    @NSManaged public var favouriteMealCheif: String?
    @NSManaged public var favouriteMealType: String?
    @NSManaged public var favouriteName: String?
    @NSManaged public var favouriteServings: String?

}

extension FavouriteRecipe : Identifiable {

}
