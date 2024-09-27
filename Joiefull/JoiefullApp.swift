//
//  JoiefullApp.swift
//  Joiefull
//
//

import SwiftUI

@main
struct JoiefullApp: App {
    @StateObject var network = Network()
      @StateObject var viewModel: ClothesViewModel
      
      init() {
          let networkInstance = Network()
          _viewModel = StateObject(wrappedValue: ClothesViewModel(network: networkInstance))
          _network = StateObject(wrappedValue: networkInstance)
      }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModel)
        }
    }
}
