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
        ZStack {
            detailedCharacter()
            VStack {
                buttonBack()
                Spacer()
            }
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

    private func imageCharacter() -> some View {
        VStack {
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
        }
    }

    private func detailedCharacter() -> some View {
        VStack {
            if let detailedCharacter = viewModel.detailedCharacter {
                imageCharacter()
                    .padding(.vertical, 16)
                Text(detailedCharacter.name)
                    .font(.title)
                    .bold()
                    .padding(4)
                Text(detailedCharacter.status)
                    .font(.body)
                    .foregroundColor(viewModel.isAlive ? .green : .red)
                    .bold()
                ScrollView(.vertical, showsIndicators: false) {
                    section(title: "Info") {
                        VStack(spacing: 16) {
                            infoCell(title: "Species",
                                     meaning: viewModel.isNotEnpty(text: detailedCharacter.species))
                            infoCell(title: "Type",
                                     meaning: viewModel.isNotEnpty(text: detailedCharacter.type))
                            infoCell(title: "Gender",
                                     meaning: viewModel.isNotEnpty(text: detailedCharacter.gender))
                        }
                    }
                    section(title: "Origin", pading: 8) {
                        HStack {
                            Image("Planet")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 24, height: 24)
                                .padding(24)
                                .background(Color.black.opacity(0.4))
                                .cornerRadius(16)
                            if let origin = viewModel.origin {
                                VStack(alignment: .leading, spacing: 16) {
                                    Text(viewModel.isNotEnpty(text: origin.name))
                                        .font(.body)
                                        .bold()
                                    Text(viewModel.isNotEnpty(text: origin.type))
                                        .font(.body)
                                        .bold()
                                        .foregroundColor(.green)
                                }
                                .padding(.horizontal, 8)
                            } else {
                                ActivityIndicator()
                                    .frame(width: 30, height: 30)
                                    .foregroundColor(.white)
                            }
                            Spacer()
                        }
                    }
                    section(title: "Episodes") {
                        VStack {
                            ForEach(0 ..< detailedCharacter.episodeUrls.count, id: \.self) { item in
                                Text("\(item)")
                                    .font(.body)
                                    .bold()
                            }
                        }
                    }
                }
                .padding()
                .listStyle(.plain)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .ignoresSafeArea()
                Spacer()
            } else {
                ActivityIndicator()
                    .frame(width: 200, height: 200)
                    .foregroundColor(.white)
            }
        }
    }

    private func headerText(_ text: String) -> some View {
        HStack {
            Text(text)
                .font(.body)
                .bold()
            Spacer()
        }
    }

    private func infoCell(title: String, meaning: String) -> some View {
        HStack {
            Text(title)
                .font(.body)
                .foregroundColor(.secondary)
                .bold()
            Spacer()
            Text(meaning)
                .font(.body)
                .bold()
        }
    }

    private func section(title: String, pading: CGFloat = 16,completion:() -> (some View)) -> some View {
        VStack {
            headerText(title)
                .padding(.vertical)
            VStack {
                completion()
            }
            .padding(pading)
            .background(Color("BackgroundColor"))
            .cornerRadius(16)
        }
    }

}
