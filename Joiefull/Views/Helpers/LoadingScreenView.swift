//
//  LoadingScreenView.swift
//  Joiefull
//

import SwiftUI

struct LoadingScreenView: View {
    var body: some View {
        ZStack {
            
            Color(red: 249/255, green: 159/255, blue: 67/255)
                .ignoresSafeArea()
            
            Image("Logo")
        }
    }
}

#Preview {
    LoadingScreenView()
}
