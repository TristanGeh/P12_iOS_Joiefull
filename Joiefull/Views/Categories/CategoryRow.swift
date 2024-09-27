//
//  CategoryRow.swift
//  Joiefull
//

import SwiftUI

struct CategoryRow: View {
    @EnvironmentObject var viewModel: ClothesViewModel
    
    var categoryName: String
    var items: [Clothe]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(categoryName)
                .font(.headline)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 0) {
                    ForEach(items) { clothe in
                        ClotheCard(clothe: clothe)
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
    
    CategoryHome()
        .environmentObject(viewModel)
}

