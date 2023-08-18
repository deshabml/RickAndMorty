//
//  NetworkError.swift
//  Rick&Morty
//
//  Created by Лаборатория on 17.08.2023.
//

import Foundation

enum NetworkError: Error {

    case badUrl
    case badResponse
    case invalidDecoding

}
