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
            VStack {
                buttonBack()
                Spacer()
            }
            detailedCharacter()
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
                section(title: "Origin") {
                    HStack {
                        Image("Planet")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 24, height: 24)
                            .padding()
                            .background(Color.green)
                            .cornerRadius(16)
                        VStack(spacing: 8) {
                            Text("sdcsdv")
                                .font(.body)
                                .bold()
                            Text("sdcsdc")
                        }
                        .padding(.horizontal, 8)

                        Spacer()
                    }
                }
//                headerText("Info")
//                        VStack(spacing: 16) {
//                            infoCell(title: "Species",
//                                     meaning: viewModel.isNotEnpty(text: detailedCharacter.species))
//                            infoCell(title: "Type",
//                                     meaning: viewModel.isNotEnpty(text: detailedCharacter.type))
//                            infoCell(title: "Gender",
//                                     meaning: viewModel.isNotEnpty(text: detailedCharacter.gender))
//                        }
//                        .padding()
//                        .background(Color("BackgroundColor"))
//                        .cornerRadius(16)
//                        .padding(.horizontal)
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
                .padding(.horizontal)
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

    private func section(title: String, completion:() -> (some View)) -> some View {
        VStack {
            headerText(title)
                .padding(.vertical)
            VStack {
                completion()
            }
            .padding()
            .background(Color("BackgroundColor"))
            .cornerRadius(16)
            .padding(.horizontal)
        }
    }

}
