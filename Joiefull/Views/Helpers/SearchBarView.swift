//
//  SearchBarView.swift
//  Joiefull
//
//  Created by Tristan Géhanne on 29/09/2024.
//

import SwiftUI

struct SearchBarView: View {
    @Binding var searchQuery: String
    
    var body: some View {
        TextField("Rechercher un vêtement...", text: $searchQuery)
            .padding()
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding(.horizontal)    }
}

