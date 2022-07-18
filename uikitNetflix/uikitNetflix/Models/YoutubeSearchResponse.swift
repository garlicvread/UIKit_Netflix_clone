//
//  YoutubeSearchResponse.swift
//  uikitNetflix
//
//  Created by 김제필 on 7/12/22.
//

import Foundation

struct YoutubeSearchResponse: Codable {
    let items: [VideoElement]
}

struct VideoElement: Codable {
    let id: VideoElementID
}

struct VideoElementID: Codable {
    let Kind: String
    let VideoID: String
}
