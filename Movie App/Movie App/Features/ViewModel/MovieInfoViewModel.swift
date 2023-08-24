//
//  MovieInfoViewModel.swift
//  Movie App
//
//  Created by Mehmet Ali Özdemir on 24.08.2023.
//

import Foundation

protocol MovieInfoProtocol {
    var view: MovieInfoOutput? { get set }
}

final class MovieInfoViewModel: MovieInfoProtocol {
    var view: MovieInfoOutput?
    
}
