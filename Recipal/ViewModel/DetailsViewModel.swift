//
//  DetailsViewModel.swift
//  Recipal
//
//  Created by Soha Ahmed Hamdy on 19/09/2023.
//

import Foundation

protocol DetailsViewModelProtocol: ObservableObject{
    func fetchReceipeDetailsData(receipeId: Int)
    func fetchSimilaritiesRecipeData(receipeId: Int)
}


class DetailsViewModel :DetailsViewModelProtocol {
 
    var remote :NetworkServicesProtocol?
    @Published var fetchedReceipeDetailData:Meal?
    @Published var fetchedSimilaritiesRecipeDetailData:SimilaritiesRecipe?
    
    init( remoteDataSource: NetworkServicesProtocol) {
        self.remote = remoteDataSource
    }
    
    func fetchReceipeDetailsData(receipeId: Int){
        remote?.fetchReceipeDetails(receipeId:receipeId) { res in
            guard let result = res else {return}
            self.fetchedReceipeDetailData = result
        }
    }
    func fetchSimilaritiesRecipeData(receipeId: Int){
        remote?.fetchSimilaritiesRecipe(receipeId:receipeId) { res in
            guard let result = res else {return}
            self.fetchedSimilaritiesRecipeDetailData = result
        }
    }
}
    
