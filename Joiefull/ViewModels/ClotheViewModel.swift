//
//  ClotheViewModel.swift
//  Joiefull
//

import SwiftUI
import Combine

class ClothesViewModel: ObservableObject {
    @Published var clothes: [Clothe] = []
    @Published var isLoading = true
    @Published var errorMessage: String?
    
    private let network = Network()
    
    var categorizedClothes: [String: [Clothe]] {
        Dictionary(
            grouping: clothes,
            by: { $0.category.rawValue }
        )
    }
    
    /*init() {
        loadClothes()
    }
    
    func loadClothes() {
        Task {
            do {
                self.isLoading = true
                let fetchedClothes = try await network.fetchClothes()
                DispatchQueue.main.async {
                    self.clothes = fetchedClothes
                    self.isLoading = false
                }
            } catch {
                DispatchQueue.main.async {
                    self.errorMessage = error.localizedDescription
                    self.isLoading = false
                }
            }
        }
    }*/
}

