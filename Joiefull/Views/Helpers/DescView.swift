//
//  DescView.swift
//  Joiefull
//

import SwiftUI

struct DescView: View {
    var clothe: Clothe
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 5) {
                Text(clothe.name)
                    .font(.system(size: 12, weight: .semibold))
                Text("\(String(format: "%.2f", clothe.price))")
                    .font(.system(size: 12, weight: .light))
            }
            
            Spacer()
            
            VStack(spacing: 5) {
                HStack(spacing: 2) {
                    Image(systemName: "star.fill")
                        .resizable()
                        .frame(width: 12, height: 12)
                        .foregroundColor(.yellow)
                    Text("\(clothe.averageRating)")
                        .font(.caption)
                }
                
                Text("\(String(format: "%.2f", clothe.originalPrice))")
                    .foregroundColor(Color.black.opacity(0.7))
                    .font(.system(size: 12, weight: .light))
                    .strikethrough()
            }
        }
    }
}

#Preview {
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
    return DescView(clothe: clotheTest)
}
