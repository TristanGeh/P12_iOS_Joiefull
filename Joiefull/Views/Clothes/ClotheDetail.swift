//
//  ClotheDetail.swift
//  Joiefull
//

import SwiftUI

struct ClotheDetail: View {
    @EnvironmentObject var viewModel: ClothesViewModel
    @Binding var clothe: Clothe
    
    @State private var comment: String = ""
    
    var body: some View {
        VStack(spacing: 15) {
            ZStack {
                AsyncImage(url: URL(string: clothe.picture.url)) { image in
                    image.image?.resizable()
                        .cornerRadius(15)
                        .scaledToFill()
                        
                    
                }
                .accessibilityLabel(Text(clothe.picture.description))
                
                VStack {
                    HStack {
                        Spacer()
                        
                        ShareButton(clothe: clothe, comment: comment)
                            .padding(.top)
                            .padding(.trailing)
                    }
                    
                    Spacer()
                    
                    HStack {
                        Spacer()
                        
                        Button(action: {
                            viewModel.toggleFavorite(for: &clothe)
                        }, label: {
                            LikeInfoView(clothe: clothe)
                        })
                    }
                    
                }
            }
            .frame(maxWidth: 700)
            
            DescView(clothe: clothe)
            
            RateButtonView(ratings: $clothe.ratings)
            
            OpinionView()
        }
        .padding()
        .padding(.top, 65)
    }
}

#Preview {
    @Previewable @State var clotheTest = Clothe(
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
    let network = Network()
    let viewModel = ClothesViewModel(network: network)
    ClotheDetail(clothe: $clotheTest)
        .environmentObject(viewModel)
    
}
