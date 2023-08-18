//
//  DetailedCharacterScreenViewModel.swift
//  Rick&Morty
//
//  Created by Лаборатория on 18.08.2023.
//

import Foundation

class DetailedCharacterScreenViewModel: ObservableObject {

    @Published var detailedCharacter: DetailedCharacter?

    init() {
        getDetailedCharacter(1)
    }

    func getDetailedCharacter(_ id: Int) {
        NetworkService.shared.getDetailedCharacter(id) { result in
            switch result {
            case .success(let detailedCharacter):
                DispatchQueue.main.async { [unowned self] in
                    self.detailedCharacter = detailedCharacter
                }
            case .failure(let error):
                    print(error.localizedDescription)
            }
        }
    }

}
