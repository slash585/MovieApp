//
//  MovieManager.swift
//  Movie App
//
//  Created by Mehmet Ali Özdemir on 24.08.2023.
//

import Foundation
import Alamofire

protocol IMovieManager {
    func fetchMovies(response: @escaping (Result<Movies?, NetworkMessages>) -> Void)
}

final class MovieManager: IMovieManager {
    
    static let shared = MovieManager()
    
    
    func fetchMovies(response: @escaping (Result<Movies?, NetworkMessages>) -> Void){
        AF.request(APIEndpoints.popularMoviesEndpoint(), headers: headers).responseDecodable(of: Movies.self) { (model) in
            guard let data = model.value else {
                response(.failure(.error))
                return
            }
            
            response(.success(data))
        }
    }
}
