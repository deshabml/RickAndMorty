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
        return characters
    }

    func detailedCharacter(from data: Data) -> DetailedCharacter? {
        guard let json = try? JSON(data: data) else { return nil }
        var episodeUrls: [String] = []
        for index in 0 ..< json["episode"].count {
            episodeUrls.append(json["episode"][index].stringValue)
        }
        var detailedCharacter = DetailedCharacter(id: json["id"].int ?? 0,
                                                  name: json["name"].stringValue,
                                                  imageUrl: json["image"].stringValue,
                                                  status: json["status"].stringValue,
                                                  species: json["species"].stringValue,
                                                  type: json["type"].stringValue,
                                                  gender: json["gender"].stringValue,
                                                  originUrl: json["origin"].stringValue,
                                                  episodeUrls: episodeUrls)
        return detailedCharacter
    }

}
