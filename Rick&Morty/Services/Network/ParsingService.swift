//
//  ParsingService.swift
//  Rick&Morty
//
//  Created by Лаборатория on 18.08.2023.
//

import Foundation
import SwiftyJSON

class ParsingService {

    static let shared = ParsingService()

    private init() { }

    func characters(from data: Data) -> [Character]? {
        guard let json = try? JSON(data: data) else { return nil }
        var characters: [Character] = []
        let jsons = json["results"]
        for index in 0 ..< jsons.count {
            let id = jsons[index]["id"].int
            let name = jsons[index]["name"].stringValue
            let imageUrl = jsons[index]["image"].stringValue
            let character = Character(id: id ?? 0,
                                      name: name,
                                      imageUrl: imageUrl)
            characters.append(character)
        }
        print(jsons[0])

        return characters
    }

}
