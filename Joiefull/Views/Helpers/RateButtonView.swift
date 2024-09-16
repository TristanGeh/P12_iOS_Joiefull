//
//  RateButtonView.swift
//  Joiefull
//

import SwiftUI

struct RateButtonView: View {
    @State private var rating: Int = 0
    private let maxRating: Int = 5
    
    var body: some View {
        HStack {
            Image(systemName: "person.slash.fill")
            
            ForEach(1..<maxRating+1, id: \.self) { index in
                Button(action: {
                    rating = index
                }, label: {
                    Image(systemName: index <= rating ? "star.fill" : "star")
                        .foregroundColor(index <= rating ? .yellow : .gray)
                })
            }
            Spacer()
        }
    }
}

#Preview {
    RateButtonView()
}
