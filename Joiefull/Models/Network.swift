//
//  Network.swift
//  Joiefull
//
//

import Foundation

class Network: ObservableObject {
    @Published var clothes: [Clothe] = []
    @Published var isLoading: Bool = true
    @Published var errorMessage: String = ""
    
    func getClothes(completion: @escaping ([Clothe]) -> Void) {
        guard let url = URL(string: "https://raw.githubusercontent.com/OpenClassrooms-Student-Center/Cr-ez-une-interface-dynamique-et-accessible-avec-SwiftUI/main/api/clothes.json") else {
            fatalError("Missing URL")
        }

        let urlRequest = URLRequest(url: url)

        let dataTask = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if let error = error {
                print("Request error: ", error)
                DispatchQueue.main.async {
                    self.isLoading = false
                }
                return
            }

            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                DispatchQueue.main.async {
                    self.isLoading = false
                }
                return
            }

            guard let data = data else {
                DispatchQueue.main.async {
                    self.isLoading = false
                }
                return
            }

            DispatchQueue.main.async {
                do {
                    let decodedClothes = try JSONDecoder().decode([Clothe].self, from: data)
                    self.clothes = decodedClothes
                    completion(decodedClothes)
                } catch {
                    print("Error decoding: ", error)
                }
                self.isLoading = false
            }
        }

        dataTask.resume()
    }
}


