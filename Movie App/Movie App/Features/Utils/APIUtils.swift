//
//  APIUtils.swift
//  Movie App
//
//  Created by Mehmet Ali Özdemir on 24.08.2023.
//

import Foundation
import Alamofire

enum NetworkMessages: String, Error {
    case error = "Error"
}

enum APIEndpoints: String {
    case IMAGE_PATH = "https://image.tmdb.org/t/p/w500"
    case BASE_URL = "https://api.themoviedb.org/3/movie"
    case POPULAR = "/popular"
        
    static func popularMoviesEndpoint() -> String {
        return "\(BASE_URL.rawValue)\(POPULAR.rawValue)"
    }
    
    static func imagePath(image: String) -> String {
        return "\(IMAGE_PATH.rawValue)\(image)"
    }
}

let headers: HTTPHeaders = [
    "accept": "application/json",
    "Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJlYTY5NWRmNjhmMzA0MzU2OWE5MmEzNGM3ZmM4NTlhZCIsInN1YiI6IjYwN2YyNzZlYzQzOWMwMDA3OTQwMGM1OCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.qy0inn4zpf3aIoEm9b29QVXag9begTvWe0m83iuC_Og"
]
