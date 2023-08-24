//
//  PersistanceManager.swift
//  Movie App
//
//  Created by Mehmet Ali Özdemir on 24.08.2023.
//

import Foundation

protocol IPersistanceManager {
    func saveMovie(movie: MovieResult) -> NetworkMessages?
}

final class PersistanceManager: IPersistanceManager {
    private let defaults = UserDefaults.standard
    
    enum Keys {
        static let movies = "movies"
    }
    
    func retrieveMovies(response: @escaping (Result<MovieResult?, NetworkMessages>) -> Void ){
        guard let moviesData = defaults.object(forKey: Keys.movies) as? Data else {
            response(.failure(.error))
            return
        }
        
        do {
            let decoder = JSONDecoder()
            let movies = try decoder.decode(MovieResult.self, from: moviesData)
            response(.success(movies))
        } catch {
            response(.failure(.error))
        }
    }
    
    func saveMovie(movie: MovieResult) -> NetworkMessages? {
        do {
            let encoder = JSONEncoder()
            let encodedMovies = try encoder.encode(movie)
            defaults.set(encodedMovies, forKey: Keys.movies)
            return nil
        } catch {
            return .error
        }
    }
}
