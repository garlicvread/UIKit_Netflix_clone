//
//  Movies.swift
//  uikitNetflix
//
//  Created by 김제필 on 7/5/22.
//

import Foundation

struct ResponsesAboutTheTrendingMovies: Codable {
    let results: [Movie]
}

struct Movie: Codable {
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

/*
 {
adult = 0;
"backdrop_path" = "/5PnypKiSj2efSPqThNjTXz8jwOg.jpg";
"genre_ids" =             (
 14,
 28
);
id = 759175;
"media_type" = movie;
"original_language" = en;
"original_title" = "The Princess";
overview = "A beautiful, strong-willed young royal refuses to wed the cruel sociopath to whom she is betrothed and is kidnapped and locked in a remote tower of her father\U2019s castle. With her scorned, vindictive suitor intent on taking her father\U2019s throne, the princess must protect her family and save the kingdom.";
popularity = "73.52800000000001";
"poster_path" = "/9pCoqX24a6rE981fY1O3PmhiwrB.jpg";
"release_date" = "2022-06-16";
title = "The Princess";
video = 0;
"vote_average" = "6.534";
"vote_count" = 44;
}
 */
