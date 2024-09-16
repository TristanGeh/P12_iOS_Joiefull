//
//  Network.swift
//  Joiefull
//
//

import Foundation

class Network: ObservableObject {
    @Published var clothes: [Clothe] = []
    
    func fetchClothes() async throws -> [Clothe] {
        let urlString = "https://raw.githubusercontent.com/OpenClassrooms-Student-Center/Cr-ez-une-interface-dynamique-et-accessible-avec-SwiftUI/main/api/clothes.json"
        
        guard let url = URL(string: urlString) else {
            throw URLError(.badURL)
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }
        
        let clothes = try JSONDecoder().decode([Clothe].self, from: data)
        DispatchQueue.main.async {
            self.clothes = clothes
        }
        return clothes
    }
}


