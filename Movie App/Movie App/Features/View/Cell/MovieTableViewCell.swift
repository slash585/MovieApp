//
//  MovieTableViewCell.swift
//  Movie App
//
//  Created by Mehmet Ali Özdemir on 24.08.2023.
//

import UIKit
import SnapKit
import Kingfisher

class MovieTableViewCell: UITableViewCell {
    
    static let reuseID = "MovieTableViewCell"
    
    private lazy var posterImageView: UIImageView = UIImageView()
    private lazy var titleLabel: UILabel = UILabel()
    private lazy var releaseLabel: UILabel = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(title: String, release: String, image: String){
        let imageUrl = URL(string: image)
        posterImageView.kf.setImage(with: imageUrl)
        titleLabel.text = title
        let releaseDate = DateConverter.shared.convertDate(release)
        releaseLabel.text = releaseDate
    }

}

//MARK: - UI Related
extension MovieTableViewCell {
    private func configure(){
      addSubview(posterImageView)
      addSubview(titleLabel)
      addSubview(releaseLabel)
      
      posterImageView.translatesAutoresizingMaskIntoConstraints = false
      titleLabel.translatesAutoresizingMaskIntoConstraints = false
      releaseLabel.translatesAutoresizingMaskIntoConstraints = false
      //
      makePosterImageView()
      makeTitleLabel()
      makeReleaseTitleLabel()
    }
    
    private func makePosterImageView(){
        posterImageView.layer.cornerRadius = 10
        posterImageView.clipsToBounds = true
        
        posterImageView.snp.makeConstraints { make in
            make.centerY.equalTo(self.snp.centerY)
            make.leading.equalToSuperview().offset(16)
            make.width.height.equalTo(120)
        }
    }
    
    private func makeTitleLabel(){
        titleLabel.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        titleLabel.textColor = .label
        titleLabel.adjustsFontSizeToFitWidth = true
        titleLabel.minimumScaleFactor = 0.9
        titleLabel.lineBreakMode = .byWordWrapping
        titleLabel.numberOfLines = 0
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(self.snp.top).offset(16)
            make.leading.equalTo(posterImageView.snp.trailing).offset(16)
        }
    }
    
    private func makeReleaseTitleLabel(){
        releaseLabel.font = UIFont.systemFont(ofSize: 12, weight: .light)
        releaseLabel.textColor = .label
        releaseLabel.adjustsFontSizeToFitWidth = true
        releaseLabel.minimumScaleFactor = 0.9
        releaseLabel.lineBreakMode = .byWordWrapping
        releaseLabel.numberOfLines = 0
        
        releaseLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(8)
            make.leading.equalTo(posterImageView.snp.trailing).offset(16)
        }
    }
}
