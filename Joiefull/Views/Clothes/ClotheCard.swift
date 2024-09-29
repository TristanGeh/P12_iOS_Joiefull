//
//  ClotheCard.swift
//  Joiefull
//

import SwiftUI

struct ClotheCard: View {
    var clothe: Clothe
    @EnvironmentObject var viewModel: ClothesViewModel
    @Binding var searchVisible: Bool
    
    var body: some View {
        VStack {
            NavigationLink(destination: ClotheDetail(clothe: $viewModel.clothes[viewModel.clothes.firstIndex(where: { $0.id == clothe.id})!], searchVisible: $searchVisible)) {
                ZStack(alignment: .bottomTrailing) {
                    AsyncImage(url: URL(string: clothe.picture.url)) { image in
                        image.image?.resizable()
                            .scaledToFill()
                            .frame(width: 198, height: 200)
                            .cornerRadius(25)
                    }
                    .accessibilityLabel(Text(clothe.picture.description))
                    
                    LikeInfoView(clothe: clothe)
                }
            }
            DescView(clothe: clothe)
                .padding([.leading, .trailing], 7)
                .frame(width: 198, height: 36)
        }
        .padding([.leading, .trailing], 5)
    }
}

#Preview {
    let network = Network()
    let viewModel = ClothesViewModel(network: network)
    
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
    @State var searchVisible = true
    
    ClotheCard(clothe: clotheTest, searchVisible: $searchVisible)
        .environmentObject(viewModel)
}
