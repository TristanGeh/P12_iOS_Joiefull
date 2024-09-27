//
//  RateButtonView.swift
//  Joiefull
//

import SwiftUI

struct RateButtonView: View{
    @Binding var ratings: [Int]
    
    @State private var minRating: Int = 0
    private let maxRating: Int = 5
    
    var body: some View {
        HStack {
            Image(systemName: "person.slash.fill")
            
            ForEach(1..<maxRating+1, id: \.self) { index in
                Button(action: {
                    minRating = index
                    ratings.append(index)
                }, label: {
                    Image(systemName: index <= minRating ? "star.fill" : "star")
                        .foregroundColor(index <= minRating ? .yellow : .gray)
                })
            }
            Spacer()
        }
    }
}
