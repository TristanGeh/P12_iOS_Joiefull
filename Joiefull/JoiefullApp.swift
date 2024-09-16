//
//  JoiefullApp.swift
//  Joiefull
//
//

import SwiftUI

@main
struct JoiefullApp: App {
    var network = Network()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(network)
        }
    }
}
