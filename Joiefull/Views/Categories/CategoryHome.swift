//
//  CategoryHome.swift
//  Joiefull
//

import SwiftUI

struct CategoryHome: View {
    @EnvironmentObject var network: Network
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            ForEach(network.categorizedClothes.keys.sorted(), id: \.self) { category in
                if let items = network.categorizedClothes[category] {
                    CategoryRow(categoryName: category, items: items)
                }
            }
        }
    }
}

#Preview {
    CategoryHome()
        .environmentObject(Network())
}
