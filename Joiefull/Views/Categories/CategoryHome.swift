//
//  CategoryHome.swift
//  Joiefull
//

import SwiftUI

struct CategoryHome: View {
    @EnvironmentObject var viewModel: ClothesViewModel
    @State var searchVisible: Bool = true
    
    var body: some View {
        VStack {
            if searchVisible {
                SearchBarView(searchQuery: $viewModel.searchQuery)
            }
            
            NavigationStack {
                ScrollView(.vertical, showsIndicators: false) {
                    ForEach(viewModel.categorizedClothes.keys.sorted(), id: \.self) { category in
                        if let items = viewModel.categorizedClothes[category] {
                            CategoryRow(searchVisible: $searchVisible, categoryName: category, items: items)
                                .environmentObject(viewModel)
                        }
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
