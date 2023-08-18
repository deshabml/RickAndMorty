//
//  EpisodeCellViewModel.swift
//  Rick&Morty
//
//  Created by Лаборатория on 18.08.2023.
//

import Foundation

class EpisodeCellViewModel: ObservableObject {

    @Published var episode: Episode?

    init(url: String) {
        getEpisode(urlString: url)
    }

    func getEpisode(urlString: String) {
        NetworkService.shared.getEpisode(urlString: urlString) { result in
            switch result {
                case .success(let episode):
                    DispatchQueue.main.async { [unowned self] in
                        self.episode = episode
                    }
                case .failure(let error):
                    print(error.localizedDescription)
            }
        }
    }

}
