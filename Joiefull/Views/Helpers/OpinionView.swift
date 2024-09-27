//
//  OpinionView.swift
//  Joiefull
//

import SwiftUI

struct OpinionView: View {
    @State private var text: String = "Donnez votre avis sur cette pièce"
    
    var body: some View {
        ZStack{
            TextEditor(text: $text)
                .frame(height: 100)
                .font(.system(size: 12))
                .foregroundColor(.black)
                .lineLimit(nil)
        }
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.gray, lineWidth: 1)
        )
        .frame(height: 150)
    }
}

#Preview {
    OpinionView()
}
