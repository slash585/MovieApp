//
//  MovieVC.swift
//  Movie App
//
//  Created by Mehmet Ali Özdemir on 24.08.2023.
//

import UIKit

protocol MovieVCOutput: AnyObject {
    func showIndicator()
    func dismissIndicator()
}

final class MovieVC: UIViewController {
    
    private lazy var viewModel = MovieViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.view = self
        viewModel.viewDidLoad()
        configureUI()
    }
}

//MARK: - UI Related
extension MovieVC {
    private func configureUI(){
        view.backgroundColor = .systemBackground
    }
}

extension MovieVC: MovieVCOutput {
    func showIndicator() {
        showLoadingView()
    }
    
    func dismissIndicator() {
        dismissLoadingView()
    }
}
