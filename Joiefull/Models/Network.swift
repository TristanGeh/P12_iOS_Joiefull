//
//  Network.swift
//  Joiefull
//
//

import Foundation

class Network: ObservableObject {
    @Published var clothes: [Clothe] = []
    @Published var isLoading = true
    @Published var errorMessage: String?
    
    var categorizedClothes: [String: [Clothe]] {
        Dictionary(
            grouping: clothes,
            by: { $0.category.rawValue }
        )
    }
    
    /*func fetchClothes() async throws -> [Clothe] {
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
    }*/
    func getClothes() {
        guard let url = URL(string: "https://raw.githubusercontent.com/OpenClassrooms-Student-Center/Cr-ez-une-interface-dynamique-et-accessible-avec-SwiftUI/main/api/clothes.json") else { fatalError("Missing URL") }

        let urlRequest = URLRequest(url: url)

        let dataTask = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if let error = error {
                print("Request error: ", error)
                return
            }

            guard let response = response as? HTTPURLResponse else { return }

            if response.statusCode == 200 {
                guard let data = data else { return }
                DispatchQueue.main.async {
                    do {
                        let decodedClothes = try JSONDecoder().decode([Clothe].self, from: data)
                        self.clothes = decodedClothes
                        self.isLoading = false
                        print(self.clothes)
                    } catch let error {
                        self.isLoading = false
                        self.errorMessage = "\(error)"
                        print("Error decoding: ", error)
                    }
                }
            }
        }

        dataTask.resume()
    }
}


