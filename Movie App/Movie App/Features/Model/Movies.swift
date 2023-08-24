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
    let adult: Bool?
    let backdropPath: String?
    let genreIDS: [Int]?
    let id: Int?
    let originalLanguage: OriginalLanguage?
    let originalTitle, overview: String?
    let popularity: Double?
    let posterPath, releaseDate, title: String?
    let video: Bool?
    let voteAverage: Double?
    let voteCount: Int?
}

enum OriginalLanguage: String, Codable {
    case en
    case es
    case ko
    case nl
}
