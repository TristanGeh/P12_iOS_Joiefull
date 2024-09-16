//
//  DescView.swift
//  Joiefull
//

import SwiftUI

struct DescView: View {
    var clothe: Clothe
    
    var body: some View {
        VStack {
            HStack {
                Text(clothe.name)
                    .font(.system(size: 15, weight: .semibold))
                Spacer()
                HStack {
                    Image(systemName: "star.fill")
                        .resizable()
                        .frame(width: 15, height: 15)
                        .foregroundColor(.yellow)
                    Text("\(clothe.likes)")
                        .font(.caption)
                }
            }
            HStack {
                Text("\(String(format: "%.2f", clothe.price))")
                    .font(.system(size: 15, weight: .light))
                Spacer()
                Text("\(String(format: "%.2f", clothe.originalPrice))")
                    .foregroundColor(Color.black.opacity(0.7))
                    .font(.system(size: 15, weight: .light))
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
