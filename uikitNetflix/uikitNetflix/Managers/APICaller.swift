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

class APICaller {
    static let shared = APICaller()

    func getTrendingMovies(completion: @escaping (String) -> Void) {

        // Create the defaul URL itself.
        guard let url = URL(string: "\(Constants.defaultURL)/3/trending/all/day?api_key=\(Constants.API_KEY)") else {return}

        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) {data, _, error in
            guard let data = data, error == nil else {
                return
            }

            do {
                
            } catch {
                print(error.localizedDescription)
            }

            // Data -> JSON object
//            let results = JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed)
        }
    }
}
