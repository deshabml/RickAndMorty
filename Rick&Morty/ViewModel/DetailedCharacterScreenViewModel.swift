//
//  DetailedCharacterScreenViewModel.swift
//  Rick&Morty
//
//  Created by Лаборатория on 18.08.2023.
//

import Foundation
import UIKit

class DetailedCharacterScreenViewModel: ObservableObject {

    @Published var detailedCharacter: DetailedCharacter?
    @Published var image: UIImage?

    func getDetailedCharacter(_ id: Int) {
        NetworkService.shared.getDetailedCharacter(id) { result in
            switch result {
            case .success(let detailedCharacter):
                DispatchQueue.main.async { [unowned self] in
                    self.detailedCharacter = detailedCharacter
                    self.downloadImage(urlString: detailedCharacter.imageUrl)
                }
            case .failure(let error):
                    print(error.localizedDescription)
            }
        }
    }

    func downloadImage(urlString: String) {
        NetworkService.shared.downloadImage(urlString: urlString) { result in
            switch result {
                case .success(let getImage):
                    DispatchQueue.main.async { [unowned self] in
                        self.image = getImage
                    }
                case .failure(let error):
                    print(error.localizedDescription)
            }
        }
    }

}
