//
//  NetworkTests.swift
//  Joiefull
//


import XCTest
@testable import Joiefull

class NetworkTests: XCTestCase {
    var network: Network!
    
    override func setUp() {
        super.setUp()
        network = Network()
    }
    
    func testGetClothes_WithValidURL_FillsClothesArray() {
        let expectation = self.expectation(description: "Fetching clothes")
        
        network.getClothes { clothes in
            XCTAssertFalse(clothes.isEmpty)
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 5, handler: nil)
    }
}

