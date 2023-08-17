//
//  NetworkService.swift
//  Rick&Morty
//
//  Created by Лаборатория on 17.08.2023.
//

import Foundation

class NetworkService {

    static let shared = NetworkService()

    private init() { }

//    func getPosts(completion: @escaping (Result<[Post], Error>) -> ()) {
//        guard let url = URLManager.shared.createUrl(endpoints: [.posts], ids: []) else {
//            completion(.failure(NetworkError.badUrl))
//            return
//        }
//
//        let task = URLSession.shared.dataTask(with: url) { data, response, error in
//            guard let data else {
//                if let error {
//                    completion(.failure(error))
//                }
//                return
//            }
//
//            let decoder = JSONDecoder()
//            do {
//                let posts = try decoder.decode([Post].self, from: data)
//                completion(.success(posts))
//            } catch {
//                completion(.failure(error))
//            }
//        }
//
//        task.resume()
//    }
//
//    func createPost(dto: Post.PostDTO, completion: @escaping (Result<Post, Error>) -> ()) {
//        guard let url = URLManager.shared.createUrl(endpoints: [.posts], ids: []) else {
//            completion(.failure(NetworkError.badUrl))
//            return
//        }
//
//        var req = URLRequest(url: url)
//        req.httpMethod = "POST"
//        req.setValue("application/json; charset=UTF-8", forHTTPHeaderField: "Content-type")
//        let encoder = JSONEncoder()
//        do {
//            let body = try encoder.encode(dto)
//            req.httpBody = body
//            URLSession.shared.dataTask(with: req) { data, _, error in
//                guard let data else {
//                    if let error {
//                        completion(.failure(error))
//                    }
//                    return
//                }
//                let decoder = JSONDecoder()
//                do {
//                    let post = try decoder.decode(Post.self, from: data)
//                    completion(.success(post))
//                } catch {
//                    completion(.failure(error))
//                }
//            }.resume()
//        } catch {
//            completion(.failure(error))
//        }
//    }

}

