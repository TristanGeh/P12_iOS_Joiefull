//
//  ContentView.swift
//  Joiefull
//
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var network: Network
    
    var body: some View {
        CategoryHome()
        .onAppear {
            network.getClothes()
        }
    }
}


#Preview {
    ContentView()
        .environmentObject(Network())
}
