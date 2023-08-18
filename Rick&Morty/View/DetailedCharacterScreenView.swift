//
//  DetailedCharacterScreenView.swift
//  Rick&Morty
//
//  Created by Лаборатория on 18.08.2023.
//

import SwiftUI

struct DetailedCharacterScreenView: View {

    @EnvironmentObject private var mainViewModel: ContentViewModel
    @StateObject private var viewModel = DetailedCharacterScreenViewModel()

    var body: some View {
        VStack {
            buttonBack()
            if let image = viewModel.image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 148, height: 148)
                    .cornerRadius(16)
            } else {
                ActivityIndicator()
                    .frame(width: 148, height: 148)
                    .foregroundColor(.white)
            }
            if let detailedCharacter = viewModel.detailedCharacter {
                Text(detailedCharacter.name)
                    .font(.title)
                    .bold()
                    .padding()
            }
            Spacer()
            Text("\(mainViewModel.selectedCharracterID ?? 0)")
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("AccentColor"))
        .onAppear {
            viewModel.getDetailedCharacter(mainViewModel.selectedCharracterID ?? 1)
        }
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
