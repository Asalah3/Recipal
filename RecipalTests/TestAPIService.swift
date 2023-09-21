//
//  TestAPIService.swift
//  RecipalTests
//
//  Created by Soha Ahmed Hamdy on 21/09/2023.
//

import XCTest
import Combine
@testable import Recipal

final class TestAPIService: XCTestCase {
    var networkService: NetworkServices?
    private var cancellable : AnyCancellable?

    
    override func setUpWithError() throws {
        networkService = NetworkServices()
    }

    override func tearDownWithError() throws {
        networkService = nil
    }

    func testLoadCategoriesFromURL(){
        let expectation = expectation(description: "Waiting for the API Data")
        cancellable = networkService?.fetchHomeCategoriesData(tag: "dinner")?
        .receive(on: DispatchQueue.main)
        .sink { completion in
            switch completion{
            case .failure(let error):
                print(error)
                XCTFail()
                expectation.fulfill()
                return
            case .finished:
                print("finished")
            }
        } receiveValue: { categories in
            XCTAssertNotEqual(categories.results?.count,0, "Failed ..")
            expectation.fulfill()
        }
        waitForExpectations(timeout: 5)
    }

    func testfetchSimilaritiesRecipe(){
        let expectation = expectation(description: "Waiting for the API Data")
        cancellable = networkService?.fetchSimilaritiesRecipe(receipeId: 8138)?
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion{
                case .failure(let error):
                    print(error)
                    XCTFail()
                    expectation.fulfill()
                    return
                case .finished:
                    print("finished")
                }
            } receiveValue: { similers in
                XCTAssertNotEqual(similers.results?.count ,0, "Failed ..")
                expectation.fulfill()
            }
        waitForExpectations(timeout: 5)
    }
    
    func testfetchReceipeDetails(){
        let expectation = expectation(description: "Waiting for the API Data")
        cancellable = networkService?.fetchReceipeDetails(receipeId: 8138)?
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion{
                case .failure(let error):
                    print(error)
                    XCTFail()
                    expectation.fulfill()
                    return
                case .finished:
                    print("finished")
                }
            } receiveValue: { details in
                XCTAssertNotEqual(details.id ,0, "Failed ..")
                expectation.fulfill()
            }
        waitForExpectations(timeout: 5)
    }
}
