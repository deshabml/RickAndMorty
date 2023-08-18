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
            buttonBack()
            Image(systemName: "person.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 148, height: 148)
                .cornerRadius(16)
            Spacer()
            Text("\(mainViewModel.selectedCharracterID ?? 0)")
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
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

extension DetailedCharacterScreenView {

    private func buttonBack() -> some View {
        HStack {
            Button {
                mainViewModel.deleteSelectedCharracter()
            } label: {
                Image(systemName: "chevron.backward")
                    .foregroundColor(.white)
            }
            Spacer()
        }
        .padding(.horizontal, 20)
    }

}
