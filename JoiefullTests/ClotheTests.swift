//
//  JoiefullTests.swift
//  JoiefullTests
//

import XCTest
@testable import Joiefull

class ClotheTests: XCTestCase {
    func testAverageRating_WithNoRatings_ReturnsZero() {
        let clothe = Clothe(id: 1, name: "Test Clothe", category: .tops, likes: 0, ratings: [], price: 10.0, originalPrice: 15.0, picture: Clothe.Picture(url: "", description: ""))
        
        XCTAssertEqual(clothe.averageRating, "0.0")
    }
    
    func testAverageRating_WithRatings_ReturnsCorrectAverage() {
        let clothe = Clothe(id: 1, name: "Test Clothe", category: .tops, likes: 0, ratings: [3, 4, 5], price: 10.0, originalPrice: 15.0, picture: Clothe.Picture(url: "", description: ""))
        
        XCTAssertEqual(clothe.averageRating, "4.0")
    }
}

