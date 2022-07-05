//
//  APICaller.swift
//  uikitNetflix
//
//  Created by 김제필 on 7/5/22.
//

import Foundation

struct Constants {
    static let API_KEY = "615c30c4ef2e34d9d7d0b5b83bdb0c43"
    static let defaultURL = "https://api.themoviedb.org/"
}

enum APIError: Error {
    case failedToGetData
}

class APICaller {
    static let shared = APICaller()

//    func getTrendingMoviesList(completion: @escaping (String) -> Void) {
    func getTrendingMoviesList(completion: @escaping (Result<[Movie], Error>) -> Void) {

        // Create the defaul URL itself.
        guard let url = URL(string: "\(Constants.defaultURL)/3/trending/movie/day?api_key=\(Constants.API_KEY)") else {return}

        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) {data, _, error in
            guard let data = data, error == nil else {
                return
            }

            do {

            } catch {
                print(error.localizedDescription)
            }

            // Data -> JSON object
            do {
//                let results = try JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed)
//                print(results)
                let results = try JSONDecoder().decode(ResponsesAboutTheTrendingMovies.self, from: data)
//                print(results.results[0].original_name)
                completion(.success(results.results))
            } catch {
//                print(error.localizedDescription)
                completion(.failure(error))
            }
        }

        task.resume()
    }

    func getTrendingTVList(completion: @escaping (Result<[String], Error>) -> Void) {
        guard let url = URL(string: "\(Constants.defaultURL)/3/trending/tv/day?api_key=\(Constants.API_KEY)") else {return}
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) {data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let results = try JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed)
                print(results)
            } catch {
                print(error.localizedDescription)
            }
        }

        task.resume()
    }
}
