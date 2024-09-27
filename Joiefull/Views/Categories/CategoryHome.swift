//
//  CategoryHome.swift
//  Joiefull
//

import SwiftUI

struct CategoryHome: View {
    @EnvironmentObject var viewModel: ClothesViewModel
    
    var body: some View {
        NavigationStack {
            ScrollView(.vertical, showsIndicators: false) {
                ForEach(viewModel.categorizedClothes.keys.sorted(), id: \.self) { category in
                    if let items = viewModel.categorizedClothes[category] {
                        CategoryRow(categoryName: category, items: items)
                            .environmentObject(viewModel)
                    }
                }
            }
        }
    }
}

#Preview {
    let network = Network()
    let viewModel = ClothesViewModel(network: network)
    CategoryHome()
        .environmentObject(viewModel)
}
