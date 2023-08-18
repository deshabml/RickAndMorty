//
//  URLManager.swift
//  Rick&Morty
//
//  Created by Лаборатория on 17.08.2023.
//

import Foundation

class URLManager {

    static let shared = URLManager()
    private let tunnel = "https://"
    private let server = Server.prod

    private init() { }

    func createUrl(endpoint: EndPoint,_ id: Int? = nil) -> URL? {
        var urlStr = tunnel + server.rawValue + endpoint.rawValue
        if let id {
            urlStr += "/\(id)"
        }
        print(urlStr)
        return URL(string: urlStr)
    }

}



enum Server: String {
    case prod = "rickandmortyapi.com/api"
}

enum EndPoint: String {
    case character = "/character"
}
