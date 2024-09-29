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
    
    func testCategorizedClothes() {
            let network = Network()
            let viewModel = ClothesViewModel(network: network)

            viewModel.clothes = [
                Clothe(id: 1, name: "Shirt", category: .tops, likes: 5, price: 29.99, originalPrice: 39.99, picture: Clothe.Picture(url: "http://example.com/image.jpg", description: "Test image")),
                Clothe(id: 2, name: "Pants", category: .bottoms, likes: 3, price: 49.99, originalPrice: 59.99, picture: Clothe.Picture(url: "http://example.com/image2.jpg", description: "Test image")),
                Clothe(id: 3, name: "Hat", category: .accessories, likes: 7, price: 19.99, originalPrice: 29.99, picture: Clothe.Picture(url: "http://example.com/image3.jpg", description: "Test image"))
            ]
            
            let categorizedClothes = viewModel.categorizedClothes
            
            XCTAssertEqual(categorizedClothes["TOPS"]?.count, 1, "There should be 1 clothe in TOPS category")
            XCTAssertEqual(categorizedClothes["BOTTOMS"]?.count, 1, "There should be 1 clothe in BOTTOMS category")
            XCTAssertEqual(categorizedClothes["ACCESSORIES"]?.count, 1, "There should be 1 clothe in ACCESSORIES category")
        }
        
        
        func testSearchClothes() {
            let network = Network()
            let viewModel = ClothesViewModel(network: network)

            viewModel.clothes = [
                Clothe(id: 1, name: "Black Shirt", category: .tops, likes: 5, price: 29.99, originalPrice: 39.99, picture: Clothe.Picture(url: "http://example.com/image.jpg", description: "Test image")),
                Clothe(id: 2, name: "White Pants", category: .bottoms, likes: 3, price: 49.99, originalPrice: 59.99, picture: Clothe.Picture(url: "http://example.com/image2.jpg", description: "Test image")),
                Clothe(id: 3, name: "Red Hat", category: .accessories, likes: 7, price: 19.99, originalPrice: 29.99, picture: Clothe.Picture(url: "http://example.com/image3.jpg", description: "Test image"))
            ]
            
            
            viewModel.searchQuery = ""
            XCTAssertEqual(viewModel.filteredClothes.count, 3, "All clothes should be shown when search query is empty")
            
            
            viewModel.searchQuery = "Shirt"
            XCTAssertEqual(viewModel.filteredClothes.count, 1, "Search for 'Shirt' should return 1 item")
            
            
            viewModel.searchQuery = "Hat"
            XCTAssertEqual(viewModel.filteredClothes.count, 1, "Search for 'Hat' should return 1 item")
            
            
            viewModel.searchQuery = "Jacket"
            XCTAssertEqual(viewModel.filteredClothes.count, 0, "Search for 'Jacket' should return 0 items")
        }
}


