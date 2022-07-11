//
//  APICaller.swift
//  uikitNetflix
//
//  Created by 김제필 on 7/5/22.
//

import Foundation

struct Constants {
    static let API_KEY = "615c30c4ef2e34d9d7d0b5b83bdb0c43"
    static let defaultURL = "https://api.themoviedb.org"
    static let YoutubeBaseURL = "https://www.googleapis.com/youtube/v3/search?"
    static let YoutubeAPI_KEY = "AIzaSyDdNRvEAZ76WSSvnLLqks41a3JQpk76Iyw"
}

enum APIError: Error {
    case failedToGetData
}

class APICaller {
    static let shared = APICaller()

//    func getTrendingMoviesList(completion: @escaping (String) -> Void) {
    func getTrendingMoviesList(completion: @escaping (Result<[Title], Error>) -> Void) {

        // Create the defaul URL itself.
        guard let url = URL(string: "\(Constants.defaultURL)/3/trending/movie/day?api_key=\(Constants.API_KEY)") else {
            return
        }

        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) {data, _, error in
            guard let data = data, error == nil else {
                return
            }

            // Data -> JSON object
            do {
//                let results = try JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed)
//                print(results)
                let results = try JSONDecoder().decode(ResponsesAboutTheTrendingTitles.self, from: data)
//                print(results.results[0].original_name)
                completion(.success(results.results))
            } catch {
//                print(error.localizedDescription)
                completion(.failure(APIError.failedToGetData))
            }
        }

        task.resume()
    }

    func getTrendingTVList(completion: @escaping (Result<[Title], Error>) -> Void) {
        guard let url = URL(string: "\(Constants.defaultURL)/3/trending/tv/day?api_key=\(Constants.API_KEY)") else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) {data, _, error in
            guard let data = data, error == nil else {
                return
            }

            do {
//                let results = try JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed)
                let results = try JSONDecoder().decode(ResponsesAboutTheTrendingTitles.self, from: data)
                completion(.success(results.results))
            } catch {
                completion(.failure(APIError.failedToGetData))
            }
        }

        task.resume()
    }

    func getPopularList(completion: @escaping(Result<[Title], Error>) -> Void) {
        guard let url = URL(string: "\(Constants.defaultURL)/3/movie/popular?api_key=\(Constants.API_KEY)&language=en-US&page=1)") else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) {data, _, error in
            guard let data = data, error == nil else {
                return
            }

            do {
                let results = try JSONDecoder().decode(ResponsesAboutTheTrendingTitles.self, from: data)
                completion(.success(results.results))
            } catch {
                completion(.failure(APIError.failedToGetData))
            }
        }

        task.resume()
    }

    func getUpcomingMovies(completion: @escaping(Result<[Title], Error>) -> Void) {
        guard let url = URL(string: "\(Constants.defaultURL)/3/movie/upcoming?api_key=\(Constants.API_KEY)&language=en-US&page=1") else {
            return
        }

        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) {data, _, error in
            guard let data = data, error == nil else {
                return
            }

            do {
                let results = try JSONDecoder().decode(ResponsesAboutTheTrendingTitles.self, from: data)
                completion(.success(results.results))
            } catch {
                completion(.failure(APIError.failedToGetData))
            }
        }

        task.resume()
    }

    func getTopRatedList(completion: @escaping(Result<[Title], Error>) -> Void) {
        guard let url = URL(string: "\(Constants.defaultURL)/3/movie/top_rated?api_key=\(Constants.API_KEY)&language=en-US&page=1") else {
            return
        }

        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) {data, _, error in
            guard let data = data, error == nil else {
                return
            }

            do {
                let results = try JSONDecoder().decode(ResponsesAboutTheTrendingTitles.self, from: data)
                completion(.success(results.results))
            } catch {
                completion(.failure(APIError.failedToGetData))
            }
        }

        task.resume()
    }

    func getDiscoveredMovie(completion: @escaping (Result<[Title], Error>) -> Void) {
        guard let url = URL(string: "\(Constants.defaultURL)/3/discover/movie?api_key=\(Constants.API_KEY)&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false&page=1&with_watch_monetization_types=flatrate") else {
            return
        }

        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) {data, _, error in
            guard let data = data, error == nil else {
                return
            }

            do {
                let results = try JSONDecoder().decode(ResponsesAboutTheTrendingTitles.self, from: data)
                completion(.success(results.results))
            } catch {
                completion(.failure(APIError.failedToGetData))
            }
        }

        task.resume()
    }

    func search(with query: String, completion: @escaping (Result<[Title], Error>) -> Void) {
        guard let query = query.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) else {
            return
        }

        guard let url = URL(string: "\(Constants.defaultURL)/3/search/movie?api_key=\(Constants.API_KEY)&query=\(query)") else {
            return
        }

        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) {data, _, error in
            guard let data = data, error == nil else {
                return
            }

            do {
                let results = try JSONDecoder().decode(ResponsesAboutTheTrendingTitles.self, from: data)
                completion(.success(results.results))
            } catch {
                completion(.failure(APIError.failedToGetData))
            }
        }

        task.resume()
    }

    func getMovie(with query: String) {
        guard let query = query.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) else {
            return
        }

        guard let url = URL(string: "\(Constants.YoutubeBaseURL)q=\(query)&key=\(Constants.YoutubeAPI_KEY)") else {
            return
        }

        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) {data, _, error in
            guard let data = data, error == nil else {
                return
            }

            do {
                let results = try JSONSerialization.jsonObject(with: data, options:  .fragmentsAllowed)
                print(results)
            } catch {
                print(error.localizedDescription)
            }
        }

        task.resume()
    }
}
