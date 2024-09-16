//
//  Clothe.swift
//  Joiefull
//
//

import Foundation

struct Clothe: Identifiable, Decodable {
    var id: Int
    var name: String
    var category: Category
    var likes: Int
    var price: String
    var originalPrice: String
    var picture: Picture

    enum Category: String, Decodable {
        case accessories = "ACCESSORIES"
        case bottoms = "BOTTOMS"
        case shoes = "SHOES"
        case tops = "TOPS"
    }
    
    struct Picture: Decodable {
        var url: String
        var description: String
    }
    
    private enum CodingKeys: String, CodingKey {
        case id, name, likes, price = "price", originalPrice = "original_price", picture, category
    }
}

