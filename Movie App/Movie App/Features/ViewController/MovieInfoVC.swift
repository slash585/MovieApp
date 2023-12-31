//
//  MovieInfoVC.swift
//  Movie App
//
//  Created by Mehmet Ali Özdemir on 24.08.2023.
//

import UIKit
import Kingfisher

protocol MovieInfoVCDelegate: AnyObject {
    func getMovieDatas(movie: MovieResult)
}

protocol MovieInfoOutput: AnyObject {
    
}

final class MovieInfoVC: UIViewController {
    
    weak var delegate: MovieVCDelegate!
    
    private lazy var viewModel = MovieInfoViewModel()
    
    private lazy var posterImageView: UIImageView = UIImageView()
    private lazy var titleLabel: UILabel = UILabel()
    private lazy var overviewLabel: UILabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.view = self
        configure()
    }
}

extension MovieInfoVC {
    private func configure(){
        view.backgroundColor = .systemBackground
        view.addSubview(posterImageView)
        view.addSubview(titleLabel)
        view.addSubview(overviewLabel)
        
        posterImageView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        overviewLabel.translatesAutoresizingMaskIntoConstraints = false
        
        makePosterImageView()
        configureViewController()
        makeTitleLabel()
        makeOverviewLabel()
    }
    
    private func configureViewController(){
        view.backgroundColor = .systemBackground
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dismissVC))
        let bookmarkButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addBookmark))
        navigationItem.rightBarButtonItem = doneButton
        navigationItem.leftBarButtonItem = bookmarkButton
    }
    
    private func makePosterImageView(){
        posterImageView.snp.makeConstraints { make in
            make.top.equalTo(view.snp.top).offset(48)
            make.centerX.equalTo(view.snp.centerX)
            make.width.equalTo(view.snp.width)
            make.height.equalToSuperview().multipliedBy(0.5)
        }
    }
    
    private func makeTitleLabel(){
        titleLabel.font = UIFont.systemFont(ofSize: 32, weight: .bold)
        titleLabel.textColor = .label
        titleLabel.adjustsFontSizeToFitWidth = true
        titleLabel.minimumScaleFactor = 0.9
        titleLabel.lineBreakMode = .byWordWrapping
        titleLabel.numberOfLines = 0
        
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(posterImageView.snp.bottom).offset(16)
            make.leading.equalTo(view.snp.leading).offset(16)
            make.trailing.equalTo(view.snp.trailing).offset(-16)
        }
    }
    
    private func makeOverviewLabel(){
        overviewLabel.font = UIFont.systemFont(ofSize: 16, weight: .light)
        overviewLabel.numberOfLines = 0
        overviewLabel.textColor = .label
        overviewLabel.adjustsFontSizeToFitWidth = true
        overviewLabel.minimumScaleFactor = 0.9
        overviewLabel.lineBreakMode = .byWordWrapping
        
        overviewLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(16)
            make.leading.equalTo(view.snp.leading).offset(16)
            make.trailing.equalTo(view.snp.trailing).offset(-16)
        }
    }
}

//MARK: - Objc funcs
extension MovieInfoVC {
    @objc private func dismissVC(){
        dismiss(animated: true)
    }
    
    @objc private func addBookmark(){
        
    }
}

extension MovieInfoVC: MovieInfoVCDelegate {
    func getMovieDatas(movie: MovieResult) {
        let image = APIEndpoints.imagePath(image: movie.posterPath ?? "")
        guard let imageUrl = URL(string: image) else { return }
        posterImageView.kf.setImage(with: imageUrl)
        titleLabel.text = movie.title
        overviewLabel.text = movie.overview
    }
}

extension MovieInfoVC: MovieInfoOutput {
    
}
