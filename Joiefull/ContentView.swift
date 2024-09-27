//
//  ContentView.swift
//  Joiefull
//
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: ClothesViewModel
    
    var body: some View {
        if viewModel.isLoading {
            LoadingScreenView()
        } else {
            CategoryHome()
                .environmentObject(viewModel)
        }
    }
}


#Preview {
    let network = Network()
    let viewModel = ClothesViewModel(network: network)
    ContentView()
        .environmentObject(viewModel)
}
