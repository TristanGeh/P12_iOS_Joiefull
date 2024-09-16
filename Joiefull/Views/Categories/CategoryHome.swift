//
//  CategoryHome.swift
//  Joiefull
//

import SwiftUI

struct CategoryHome: View {
    @EnvironmentObject var viewModel: ClothesViewModel
    
    var body: some View {
        NavigationSplitView {
            if viewModel.isLoading {
                ProgressView("Loading...")
            } else if let errorMessage = viewModel.errorMessage {
                Text("Error: \(errorMessage)")
            } else {
                List {
                    ForEach(viewModel.categorizedClothes.keys.sorted(), id: \.self) { category in
                        if let items = viewModel.categorizedClothes[category] {
                            CategoryRow(categoryName: category, items: items)
                        }
                    }
                }
            }
        } detail: {
            Text("Sélectionner une catégorie de vêtements")
        }
    }
}

#Preview {
    CategoryHome()
        .environmentObject(ClothesViewModel())
}
