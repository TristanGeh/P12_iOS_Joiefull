//
//  CategoryRow.swift
//  Joiefull
//

import SwiftUI

struct CategoryRow: View {
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
                    }
                }
            }
        }
        .padding(.leading, 10)
    }
}

#Preview {
    let viewModel = PreviewClothesViewModel()
    return CategoryRow(categoryName: "TOPS", items: viewModel.clothes)
}
