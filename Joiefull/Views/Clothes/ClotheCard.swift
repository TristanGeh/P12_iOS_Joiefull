//
//  ClotheCard.swift
//  Joiefull
//

import SwiftUI

struct ClotheCard: View {
    var clothe: Clothe
    
    
    var body: some View {
        VStack {
            ZStack(alignment: .bottomTrailing) {
                AsyncImage(url: URL(string: clothe.picture.url)) { image in
                    image.image?.resizable()
                        .scaledToFill()
                        .frame(width: 180, height: 200)
                        .cornerRadius(20)
                }
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
                    Text("\(clothe.price)")
                        .font(.system(size: 15, weight: .light))
                    Spacer()
                    Text("\(clothe.originalPrice)")
                        .foregroundColor(Color.black.opacity(0.7))
                        .font(.system(size: 15, weight: .light))
                        .strikethrough()
                }
            }
            .padding([.leading, .trailing], 10)
        }
        .padding([.leading, .trailing], 5)
    }
}

#Preview {
    let clotheTest = Clothe(
        id: 1,
        name: "Pantalon noir",
        category: .bottoms,
        likes: 54,
        price: "49.99",
        originalPrice: "69.99",
        picture: Clothe.Picture(
            url: "https://raw.githubusercontent.com/OpenClassrooms-Student-Center/Cr-ez-une-interface-dynamique-et-accessible-avec-SwiftUI/main/img/bottoms/2.jpg",
            description: "Homme en chemise blanche et pantalon noir assis dans la forêt"
        )
    )
    return ClotheCard(clothe: clotheTest)
}
