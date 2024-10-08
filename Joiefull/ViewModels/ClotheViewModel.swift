//
//  ClotheViewModel.swift
//  Joiefull
//

import SwiftUI
import Combine

class ClothesViewModel: ObservableObject {
    @Published var clothes: [Clothe] = []
    @Published var isLoading = false
    @Published var searchQuery : String = ""
    
    private var network: Network
    
    init(network: Network) {
        self.network = network
        loadClothes()
    }
    
    var categorizedClothes: [String: [Clothe]] {
        Dictionary(
            grouping: filteredClothes,
            by: { $0.category.rawValue }
        )
    }
    
    var filteredClothes: [Clothe] {
        if searchQuery.isEmpty {
            return clothes
        } else {
            return clothes.filter { clothe in
                clothe.name.lowercased().contains(searchQuery.lowercased()) || clothe.category.rawValue.lowercased().contains(searchQuery.lowercased())
            }
        }
    }
    
    func loadClothes() {
        self.isLoading = true
        network.getClothes { [weak self] loadedClothes in
            DispatchQueue.main.async {
                self?.clothes = loadedClothes.map { clothe in
                    var updatedClothe = clothe
                    let numberOfRatings = Int.random(in: 1...4)
                    updatedClothe.ratings = (0..<numberOfRatings).map { _ in
                        Int.random(in: 1...5)
                    }
                    return updatedClothe
                }
                self?.isLoading = false
            }
        }
    }
    
    func toggleFavorite(for clothe: inout Clothe) {
        if clothe.isFavorite {
            clothe.likes -= 1
            clothe.isFavorite = false
        } else {
            clothe.likes += 1
            clothe.isFavorite = true
        }
    }
}



