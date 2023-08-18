//
//  NetworkService.swift
//  Rick&Morty
//
//  Created by Лаборатория on 17.08.2023.
//

import Foundation
import UIKit

class NetworkService {

    static let shared = NetworkService()

    private init() { }

    func getCharacter(completion: @escaping (Result<[Character], Error>) -> ()) {
        guard let url = URLManager.shared.createUrl(endpoint: .character) else {
            completion(.failure(NetworkError.badUrl))
            return
        }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data else {
                if let error {
                    completion(.failure(error))
                }
                return
            }
            guard let characters = ParsingService.shared.characters(from: data) else {
                if let error {
                    completion(.failure(error))
                }
                return
            }
                completion(.success(characters))
        }
        task.resume()
    }

    func getDetailedCharacter(_ id: Int, completion: @escaping (Result<DetailedCharacter, Error>) -> ()) {
        guard let url = URLManager.shared.createUrl(endpoint: .character, id) else {
            completion(.failure(NetworkError.badUrl))
            return
        }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data else {
                if let error {
                    completion(.failure(error))
                }
                return
            }
            guard let detailedCharacter = ParsingService.shared.detailedCharacter(from: data) else {
                if let error {
                    completion(.failure(error))
                }
                return
            }
                completion(.success(detailedCharacter))
        }
        task.resume()
    }

    func getOrigin(urlString: String, completion: @escaping (Result<Origin, Error>) -> ()) {
        guard let url = URL(string: urlString) else {
            completion(.failure(NetworkError.badUrl))
            return
        }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data else {
                if let error {
                    completion(.failure(error))
                }
                return
            }
            guard let origin = ParsingService.shared.origin(from: data) else {
                if let error {
                    completion(.failure(error))
                }
                return
            }
                completion(.success(origin))
        }
        task.resume()
    }

    func downloadImage(urlString: String, completion: @escaping (Result<UIImage, Error>) -> ()) {
        guard let url = URL(string: urlString) else {
            completion(.failure(NetworkError.badUrl))
            return
        }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data else {
                if let error {
                    completion(.failure(error))
                }
                return
            }
            guard let image = UIImage(data: data) else {
                if let error {
                    completion(.failure(error))
                }
                return
            }
                completion(.success(image))
        }
        task.resume()
    }

}

