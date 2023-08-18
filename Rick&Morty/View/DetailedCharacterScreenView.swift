//
//  DetailedCharacterScreenView.swift
//  Rick&Morty
//
//  Created by Лаборатория on 18.08.2023.
//

import SwiftUI

struct DetailedCharacterScreenView: View {

    @EnvironmentObject private var mainViewModel: ContentViewModel

    var body: some View {
        VStack {
            Button {
                mainViewModel.deleteSelectedCharracter()
            } label: {
                Text("Back")
                    .foregroundColor(.white)
            }
            Text("\(mainViewModel.selectedCharracterID ?? 0)")
        }
        .background(Color("AccentColor"))
    }

}

struct DetailedCharacterScreenView_Previews: PreviewProvider {

    static var previews: some View {
        VStack {
            DetailedCharacterScreenView()
                .environmentObject(ContentViewModel())
        }
        .preferredColorScheme(.dark)
    }

}
