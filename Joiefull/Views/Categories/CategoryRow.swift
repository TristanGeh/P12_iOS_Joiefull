//
//  CategoryRow.swift
//  Joiefull
//

import SwiftUI

struct CategoryRow: View {
    @EnvironmentObject var viewModel: ClothesViewModel
    @Binding var searchVisible: Bool
    
    var categoryName: String
    var items: [Clothe]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(categoryName)
                .font(.headline)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 0) {
                    ForEach(items) { clothe in
                        ClotheCard(clothe: clothe, searchVisible: $searchVisible)
                            .environmentObject(viewModel)
                    }
                }
            }
        }
        .padding(.leading, 10)
        .padding(.bottom, 10)
    }
}

#Preview {
    let network = Network()
    let viewModel = ClothesViewModel(network: network)
    @State var searchVisible: Bool = false
    
    let clotheTest = Clothe(
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
    )
    
    CategoryRow(searchVisible: $searchVisible, categoryName: clotheTest.category.rawValue , items: [clotheTest])
        .environmentObject(viewModel)
}

