//
//  CharacterListScreenView.swift
//  Rick&Morty
//
//  Created by Лаборатория on 17.08.2023.
//

import SwiftUI

struct CharacterListScreenView: View {

    @EnvironmentObject private var mainViewModel: ContentViewModel

    var body: some View {
        VStack {
            CharacterListScreenUIViewControllerRepresentable(labelText: "New Text Hear")
                .environmentObject(mainViewModel)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("AccentColor"))
        .ignoresSafeArea()
//        .navigationBarTitleDisplayMode(.large)
//        .navigationTitle("Characters")
    }

}

struct CharacterListScreenView_Previews: PreviewProvider {

    static var previews: some View {
        NavigationView {
            VStack {
                CharacterListScreenView()
                    .environmentObject(ContentViewModel())
            }
            .background(Color("AccentColor"))
        }
        .preferredColorScheme(.dark)
    }
    
}
