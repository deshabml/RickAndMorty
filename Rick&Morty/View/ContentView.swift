//
//  ContentView.swift
//  Rick&Morty
//
//  Created by Лаборатория on 17.08.2023.
//

import SwiftUI

struct ContentView: View {

    @StateObject private var viewModel = ContentViewModel()

    var body: some View {
        VStack {
            if let _ = viewModel.selectedCharracterID {
                DetailedCharacterScreenView()
                    .environmentObject(viewModel)
            } else {
                CharacterListScreenView()
                    .environmentObject(viewModel)
            }
        }
        .preferredColorScheme(.dark)
        .animation(.easeInOut,
                   value: viewModel.selectedCharracterID)
    }
    
}

struct ContentView_Previews: PreviewProvider {

    static var previews: some View {
        ContentView()
    }
    
}
