//
//  TestDetailsVM.swift
//  RecipalTests
//
//  Created by Soha Ahmed Hamdy on 21/09/2023.
//

import XCTest
import Combine
@testable import Recipal

final class TestDetailsVM: XCTestCase {
    var networkService: NetworkServices?
    var detailsVM : DetailsViewModel?
    
    
    override func setUpWithError() throws {
        networkService = NetworkServices()
        detailsVM = DetailsViewModel(remoteDataSource: networkService!)
    }
    
    override func tearDownWithError() throws {
        detailsVM = nil
        networkService = nil
    }
    
    
    func testfetchMealDetailsData(){
        let cancellable = detailsVM?.$fetchedReceipeDetailData
            .dropFirst(1)
            .sink(receiveValue: { output in
                XCTAssertNotEqual(output?.id,0)
            })
        detailsVM?.fetchReceipeDetailsData(receipeId: 868)
    }
    
    
    func testfetchMealSimilersData(){
        let cancellable = detailsVM?.$fetchedSimilaritiesRecipeDetailData
            .dropFirst(1)
            .sink(receiveValue: { output in
                XCTAssertNotEqual(output?.results?.count,0)
            })
        detailsVM?.fetchSimilaritiesRecipeData(receipeId: 868)
    }
    
}
