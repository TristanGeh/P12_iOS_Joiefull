//
//  ClotheDetail.swift
//  Joiefull
//

import SwiftUI

struct ClotheDetail: View {
    var clothe: Clothe
    
    
    var body: some View {
        VStack(spacing: 15) {
            ZStack {
                AsyncImage(url: URL(string: clothe.picture.url)) { image in
                    image.image?.resizable()
                        .cornerRadius(15)
                        .scaledToFill()
                    
                }
                .accessibilityLabel(Text(clothe.picture.description))
                
                
                LikeInfoView(clothe: clothe)
                
                ShareButton()
            }
            
            DescView(clothe: clothe)
            
            RateButtonView()
            
            OpinionView()
        }
        .padding()
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
   return ClotheDetail(clothe: clotheTest)
    
}
