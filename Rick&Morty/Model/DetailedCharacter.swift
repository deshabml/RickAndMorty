//
//  DetailedCharacter.swift
//  Rick&Morty
//
//  Created by Лаборатория on 18.08.2023.
//

import Foundation

struct DetailedCharacter: Identifiable, Decodable {

    let id: Int
    let name: String
    let imageUrl: String
    let status: String
    let species: String
    let type: String
    let gender: String
    let originUrl: String
    let episodeUrls: [String]
    
}
