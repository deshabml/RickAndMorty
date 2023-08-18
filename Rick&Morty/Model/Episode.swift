//
//  Episode.swift
//  Rick&Morty
//
//  Created by Лаборатория on 18.08.2023.
//

import Foundation

struct Episode: Identifiable, Decodable {

    let id: Int
    let name: String
    let episode: String
    let air_date: String

}
