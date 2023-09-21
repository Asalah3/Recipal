//
//  DetailsViewModel.swift
//  Recipal
//
//  Created by Soha Ahmed Hamdy on 19/09/2023.
//

import Foundation
import Combine

protocol DetailsViewModelProtocol: ObservableObject{
    func fetchReceipeDetailsData(receipeId: Int)
    func fetchSimilaritiesRecipeData(receipeId: Int)
}


class DetailsViewModel :DetailsViewModelProtocol {
 
    var remote :NetworkServicesProtocol?
    @Published var fetchedReceipeDetailData:Meal?
    @Published var fetchedSimilaritiesRecipeDetailData:SimilaritiesRecipe?
    @Published var isReqestDetailsFailed = false
    @Published var isReqestSimilersFailed = false
    @Published var isLoading = false
    private var cancellableDetails : AnyCancellable?
    private var cancellableSimilers : AnyCancellable?

    
    init( remoteDataSource: NetworkServicesProtocol) {
        self.remote = remoteDataSource
    }
    
    func fetchReceipeDetailsData(receipeId: Int){
        isLoading = true
        cancellableDetails = remote?.fetchReceipeDetails(receipeId:receipeId)?
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion{
                case .failure(let error):
                    self.isReqestDetailsFailed = true
                    print(error)
                case .finished:
                    print("finished")
                    self.isLoading = false
                }
            } receiveValue: { details in
                self.fetchedReceipeDetailData = details
                self.isLoading = false
            }
    }
    
    
    func fetchSimilaritiesRecipeData(receipeId: Int){
        cancellableSimilers = remote?.fetchSimilaritiesRecipe(receipeId:receipeId)?
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion{
                case .failure(let error):
                    self.isReqestSimilersFailed = true
                    print(error)
                case .finished:
                    print("finished")
                }
            } receiveValue: { similers in
                self.fetchedSimilaritiesRecipeDetailData = similers
            }
    }
}
    
