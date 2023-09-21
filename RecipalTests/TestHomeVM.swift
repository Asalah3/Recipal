//
//  TestHomeVM.swift
//  RecipalTests
//
//  Created by Soha Ahmed Hamdy on 21/09/2023.
//

import XCTest
import Combine
@testable import Recipal

final class TestHomeVM: XCTestCase {
    var networkService: NetworkServices?
    var homeVM : HomeViewModel?    
    
    override func setUpWithError() throws {
        networkService = NetworkServices()
        homeVM = HomeViewModel(remoteDataSource: networkService!)
        
    }
    
    override func tearDownWithError() throws {
        homeVM = nil
        networkService = nil
    }
    
    func testfetchCategoryData(){
        let cancellable = homeVM?.$fetchedHomeData
            .dropFirst(1)
            .sink(receiveValue: { output in
                XCTAssertNotEqual(output?.results?.count,0)
            })
        
        homeVM?.fetchHomeData(tag: "dinner")
    }
    
}
