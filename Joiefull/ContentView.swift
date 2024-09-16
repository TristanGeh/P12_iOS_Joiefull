//
//  ContentView.swift
//  Joiefull
//
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = ClothesViewModel()
    
    var body: some View {
        Group {
            if viewModel.isLoading {
                ProgressView("Loading...")
            } else if let errorMessage = viewModel.errorMessage {
                Text("Error: \(errorMessage)")
            } else {
                CategoryHome()
            }
        }
        .onAppear {
            viewModel.loadClothes()
        }
    }
}

#Preview {
    ContentView()
}
