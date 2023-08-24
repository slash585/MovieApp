//
//  MovieViewModel.swift
//  Movie App
//
//  Created by Mehmet Ali Özdemir on 24.08.2023.
//

import Foundation

protocol MovieViewModelProtocol {
    var view: MovieVCOutput? { get set }
    func viewDidLoad()
    func getMovies()
    var movies: Movies? { get set }
}

final class MovieViewModel: MovieViewModelProtocol {
    weak var view: MovieVCOutput?
    var movies: Movies?
    
    func viewDidLoad() {
        getMovies()
    }
    
    func getMovies() {
        MovieManager.shared.fetchMovies { [weak self] response in
            guard let strongSelf = self else { return }
            strongSelf.view?.showIndicator()
            DispatchQueue.main.async {
                switch response {
                case .success(let movies):
                    strongSelf.view?.dismissIndicator()
                    strongSelf.movies = movies
                case .failure(let error):
                    strongSelf.view?.dismissIndicator()
                    print(error)
                }
            }
        }
    }
}
