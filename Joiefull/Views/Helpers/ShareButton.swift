//
//  ShareButton.swift
//  Joiefull
//

import SwiftUI
import UIKit

struct ShareButton: View {
    @State private var isShowingShareSheet = false
    var body: some View {
        Button(action: {
            isShowingShareSheet = true
        }, label: {
            Image(systemName: "square.and.arrow.up.circle")
        })
        .sheet(isPresented: $isShowingShareSheet, content: {
            ShareSheet(items: ["test"])
        })
    }
}

struct ShareSheet: UIViewControllerRepresentable {
    var items: [Any]
    
    func makeUIViewController(context: Context) -> some UIActivityViewController {
        let controller = UIActivityViewController(activityItems: items, applicationActivities: nil)
        return controller
    }
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
}

#Preview {
    ShareButton()
}
