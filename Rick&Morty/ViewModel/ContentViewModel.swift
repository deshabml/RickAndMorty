//
//  ContentViewModel.swift
//  Rick&Morty
//
//  Created by Лаборатория on 17.08.2023.
//

import Foundation

class ContentViewModel: ObservableObject {

    @Published var selectedCharracterID: Int? = nil
    var characters: [Character]?

    func getCharacter(completion: @escaping () -> ()) {
        NetworkService.shared.getCharacter { result in
            switch result {
            case .success(let characters):
                DispatchQueue.main.async { [unowned self] in
                    self.characters = characters
                    completion()
                }
            case .failure(let error):
                    print(error.localizedDescription)
            }
        }
    }

    func setupSelectedCharracter(_ selectedCharracterID: Int) {
        self.selectedCharracterID = selectedCharracterID
        print(selectedCharracterID)
    }


}
