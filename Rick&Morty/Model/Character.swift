//
//  Character.swift
//  Rick&Morty
//
//  Created by Лаборатория on 17.08.2023.
//

import Foundation

struct Character: Identifiable, Decodable {

    let id: Int
    let name: String
    let imageUrl: String

}
