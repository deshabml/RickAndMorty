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
            CharacterListScreenUIViewControllerRepresentable()
                .environmentObject(mainViewModel)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("AccentColor"))
        .ignoresSafeArea()
    }

}

struct CharacterListScreenView_Previews: PreviewProvider {

    static var previews: some View {
            VStack {
                CharacterListScreenView()
                    .environmentObject(ContentViewModel())
            }
            .preferredColorScheme(.dark)
    }
    
}
