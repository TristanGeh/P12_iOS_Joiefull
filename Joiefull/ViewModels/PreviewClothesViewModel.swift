//
//  PreviewClothesViewModel.swift
//  Joiefull
//
//  Created by Tristan Géhanne on 16/09/2024.
//

import Foundation

class PreviewClothesViewModel: ObservableObject {
    @Published var clothes: [Clothe] = [
            Clothe(
                id: 1,
                name: "Pantalon noir",
                category: .bottoms,
                likes: 54,
                price: 49.99,
                originalPrice: 69.99,
                picture: Clothe.Picture(
                    url: "https://raw.githubusercontent.com/OpenClassrooms-Student-Center/Cr-ez-une-interface-dynamique-et-accessible-avec-SwiftUI/main/img/bottoms/2.jpg",
                    description: "Homme en chemise blanche et pantalon noir assis dans la forêt"
                )
            ),
            Clothe(
                id: 2,
                name: "Blazer marron",
                category: .tops,
                likes: 15,
                price: 79.99,
                originalPrice: 79.99,
                picture: Clothe.Picture(
                    url: "https://raw.githubusercontent.com/OpenClassrooms-Student-Center/Cr-ez-une-interface-dynamique-et-accessible-avec-SwiftUI/main/img/tops/1.jpg",
                    description: "Homme en costume et veste de blazer qui regarde la caméra"
                )
            )
        ]
        
        var categorizedClothes: [String: [Clothe]] {
            Dictionary(
                grouping: clothes,
                by: { $0.category.rawValue }
            )
        }
}
