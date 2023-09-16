//
//  HomeViewModel.swift
//  Recipal
//
//  Created by Soha Ahmed Hamdy on 02/01/2022.
//

import Foundation

protocol HomeViewModelProtocol : ObservableObject{
    func fetchHomeData(tag :String)
}


class HomeViewModel :HomeViewModelProtocol {
 
    var remote :NetworkServicesProtocol?
    @Published var fetchedHomeData:Categories! = Categories(count: 0, results: [])
    
    init( remoteDataSource: NetworkServicesProtocol) {
        self.remote = remoteDataSource
    }
    
    func fetchHomeData(tag :String){
        DispatchQueue.main.async {
            self.remote?.fetchHomeCategoriesData(tag:tag) { res in
                guard let result = res else {return}
                self.fetchedHomeData = result
            }
        }
    }
    
}
    
