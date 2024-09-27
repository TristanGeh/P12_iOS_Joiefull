//
//  ShareButton.swift
//  Joiefull
//

import SwiftUI
import UIKit

import SwiftUI

struct ShareButton: View {
    var clothe: Clothe
    var comment: String
    
    var body: some View {
        AsyncImage(url: URL(string: clothe.picture.url)) { imagePhase in
            switch imagePhase {
            case .empty:
                ProgressView()
            case .success(let image):
                ShareLink(item: clothe.name,
                          subject: Text("\(comment)"),
                          preview: SharePreview("\(clothe.name)", image: image)) {
                    Image(systemName: "square.and.arrow.up.circle")
                        .resizable()
                        .foregroundColor(.black)
                        .frame(width: 30, height: 30)
                }
            case .failure(_):
                Text("Failed to load image")
            }
        }
    }
}


