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
    var isAlive: Bool {
        detailedCharacter?.status == "Alive"
    }
    @Published var origin: Origin?

    func getDetailedCharacter(_ id: Int) {
        NetworkService.shared.getDetailedCharacter(id) { result in
            switch result {
            case .success(let detailedCharacter):
                DispatchQueue.main.async { [unowned self] in
                    self.detailedCharacter = detailedCharacter
                    self.downloadImage(urlString: detailedCharacter.imageUrl)
                    if detailedCharacter.originUrl.count > 0 {
                        self.getOrigin(urlString: detailedCharacter.originUrl)
                    } else {
                        self.origin = Origin(id: 0,
                                             name: "None",
                                             type: "None")
                    }
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

    func getOrigin(urlString: String) {
        NetworkService.shared.getOrigin(urlString: urlString) { result in
            switch result {
                case .success(let origin):
                    DispatchQueue.main.async { [unowned self] in
                        self.origin = origin
                        print(origin.name)
                        print(origin.type)
                    }
                case .failure(let error):
                    print(error.localizedDescription)
            }
        }
    }

    func isNotEnpty(text: String) -> String {
        if text.count == 0 {
            return "None"
        } else {
            return text
        }
    }

}
