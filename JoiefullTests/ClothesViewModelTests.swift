//
//  ClothesViewModelTests.swift
//  JoiefullTests
//

import Testing

import XCTest
@testable import Joiefull

class ClothesViewModelTests: XCTestCase {

    func testLoadClothes() {
        let network = Network()
        let viewModel = ClothesViewModel(network: network)

        let expectation = self.expectation(description: "Load clothes")
        
        viewModel.loadClothes()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            XCTAssertGreaterThan(viewModel.clothes.count, 0)
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 5, handler: nil)
    }
    
    func testToggleFavorite() {
        var clothe = Clothe(
            id: 1,
            name: "Test Clothe",
            category: .bottoms,
            likes: 10,
            ratings: [],
            price: 29.99,
            originalPrice: 39.99,
            picture: Clothe.Picture(url: "http://example.com/image.jpg", description: "Test image")
        )
        
        let viewModel = ClothesViewModel(network: Network())
        
        viewModel.toggleFavorite(for: &clothe)
        XCTAssertTrue(clothe.isFavorite)
        XCTAssertEqual(clothe.likes, 11)
        
        viewModel.toggleFavorite(for: &clothe)
        XCTAssertFalse(clothe.isFavorite)
        XCTAssertEqual(clothe.likes, 10)
    }
}


