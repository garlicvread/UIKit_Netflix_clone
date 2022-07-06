//
//  Movies.swift
//  uikitNetflix
//
//  Created by 김제필 on 7/5/22.
//

import Foundation

struct ResponsesAboutTheTrendingTitles: Codable {
    let results: [Title]
}

struct Title: Codable {
    let id: Int
    let media_type: String?
    let original_name: String?
    let original_title: String?
    let poster_path: String?
    let overview: String?
    let vote_count: Int?
    let vote_average: Double?
    let release_date: String?
}
