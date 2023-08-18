//
//  ContentViewModel.swift
//  Rick&Morty
//
//  Created by Лаборатория on 17.08.2023.
//

import Foundation

class ContentViewModel: ObservableObject {

    @Published var selectedCharracter: Int? = nil
    var characters: [Character]?

//    init() {
//        do {
//            try getCharacter()
//        } catch {
//            print("Ошибка загрузки данных")
//        }
//    }

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


}
