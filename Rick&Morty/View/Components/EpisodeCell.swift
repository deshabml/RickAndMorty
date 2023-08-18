//
//  EpisodeCell.swift
//  Rick&Morty
//
//  Created by Лаборатория on 18.08.2023.
//

import SwiftUI

struct EpisodeCell: View {

    @StateObject var viewModel: EpisodeCellViewModel

    var body: some View {
        VStack {
            if let episode = viewModel.episode {
                VStack(spacing: 16) {
                    HStack {
                        Text(episode.name)
                            .font(.body)
                            .bold()
                        Spacer()
                    }
                    HStack {
                        Text(episode.episode)
                            .font(.custom("AvenirNext", size: CGFloat(13)))
                            .foregroundColor(.green)
                        Spacer()
                        Text(episode.air_date)
                            .font(.custom("AvenirNext", size: CGFloat(13)))
                            .foregroundColor(.secondary)
                    }
                }
            } else {
                ActivityIndicator()
                    .frame(width: 50, height: 50)
                    .foregroundColor(.white)
            }
        }
    }

}

struct EpisodeCell_Previews: PreviewProvider {

    static var previews: some View {
        VStack {
            EpisodeCell(viewModel: EpisodeCellViewModel(url: "https://rickandmortyapi.com/api/episode/1"))
        }
        .preferredColorScheme(.dark)
    }

}
