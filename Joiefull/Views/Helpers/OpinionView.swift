//
//  OpinionView.swift
//  Joiefull
//

import SwiftUI

struct OpinionView: View {
    @State private var text: String = ""
    
    var body: some View {
        ZStack{
            TextEditor(text: $text)
                .frame(height: 100)
                .font(.system(size: 12))
                .foregroundColor(.black)
                .lineLimit(nil)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.gray, lineWidth: 1)
                )
            
            GeometryReader { geometry in
                Text("Donnez votre avis sur cette pièce")
                    .font(.caption)
                    .background(Color.white)
                    .foregroundColor(.black)
                    .position(x: geometry.size.width * 0.3, y: geometry.size.height * 0.434)
            }
        }
    }
}

#Preview {
    OpinionView()
}
