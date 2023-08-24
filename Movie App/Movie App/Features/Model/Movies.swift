//
//  Moviews.swift
//  Movie App
//
//  Created by Mehmet Ali Özdemir on 24.08.2023.
//

import Foundation

// MARK: - Movies
struct Movies: Codable {
    let page: Int?
    let movieResults: [MovieResult]?
    let totalPages, totalResults: Int?
    
    private enum CodingKeys: String, CodingKey {
        case movieResults = "results" 
        case page, totalPages, totalResults
    }
}

// MARK: - Result
struct MovieResult: Codable {
    let adult: Bool
    let backdropPath: String?
    let genreIds: [Int]
    let id: Int
    let originalLanguage: String
    let originalTitle: String
    let overview: String
    let popularity: Double
    let posterPath: String?
    let releaseDate: String
    let title: String
    let video: Bool
    let voteAverage: Double
    let voteCount: Int
    
    private enum CodingKeys: String, CodingKey {
        case adult, backdropPath = "backdrop_path", genreIds = "genre_ids", id, originalLanguage = "original_language", originalTitle = "original_title", overview, popularity, posterPath = "poster_path", releaseDate = "release_date", title, video, voteAverage = "vote_average", voteCount = "vote_count"
    }
    
}

enum OriginalLanguage: String, Codable {
    case en
    case es
    case ko
    case nl
}
