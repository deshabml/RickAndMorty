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

    func createUrl(endpoint: EndPoint) -> URL? {
//        guard endpoints.count >= ids.count else { return nil }
        let urlStr = tunnel + server.rawValue + endpoint.rawValue
//        for (index, endpoint) in endpoints.enumerated() {
//            if index < ids.count {
//                urlStr += "\(endpoint.rawValue)/\(ids[index])"
//            } else {
//                urlStr += endpoint.rawValue
//            }
//        }
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
