//
//  LikeInfoView.swift
//  Joiefull
//

import SwiftUI

struct LikeInfoView: View {
    var clothe: Clothe
    var body: some View {
        HStack {
            Image(systemName: "heart")
                .resizable()
                .frame(width: 13, height: 13)
            Text("\(clothe.likes)")
                .font(.caption)
        }
        .padding(5)
        .background(.white)
        .cornerRadius(25)
        .offset(x: -8, y: -8)

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
    return LikeInfoView(clothe: clotheTest)
}
