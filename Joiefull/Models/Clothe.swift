//
//  Clothe.swift
//  Joiefull
//
//

import Foundation

struct Clothe: Identifiable, Codable {
    var id: Int
    var name: String
    var category: Category
    var likes: Int
    var ratings: [Int] = []
    var price: Double
    var originalPrice: Double
    var picture: Picture
    var isFavorite: Bool = false
    
    

    enum Category: String, Codable {
        case accessories = "ACCESSORIES"
        case bottoms = "BOTTOMS"
        case shoes = "SHOES"
        case tops = "TOPS"
    }
    
    struct Picture: Codable {
        var url: String
        var description: String
    }
    
    private enum CodingKeys: String, CodingKey {
        case id, name, likes, price = "price", originalPrice = "original_price", picture, category
    }
    
    
    var averageRating: String {
            guard !ratings.isEmpty else { return "0.0" }
            let average = Double(ratings.reduce(0, +)) / Double(ratings.count)
            return String(format: "%.1f", average)
        }
}

