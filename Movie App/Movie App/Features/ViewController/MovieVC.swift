//
//  MovieVC.swift
//  Movie App
//
//  Created by Mehmet Ali Özdemir on 24.08.2023.
//

import UIKit
import SnapKit

protocol MovieVCOutput: AnyObject {
    func showIndicator()
    func dismissIndicator()
    func prepareTableView()
    func reloadTableView()
    func prepareSearchController()
}

protocol MovieVCDelegate: AnyObject {}

final class MovieVC: UIViewController {
    
    private lazy var viewModel = MovieViewModel()
    private lazy var tableView: UITableView = UITableView()
    
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
        title = "Movies"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
}

extension MovieVC: MovieVCOutput {    
    func prepareSearchController() {
        let searchController = UISearchController()
        searchController.searchResultsUpdater = self
        searchController.searchBar.delegate = self
        searchController.searchBar.placeholder = "Search for a movie name"
        searchController.obscuresBackgroundDuringPresentation = false
        navigationItem.searchController = searchController
    }
    
    func reloadTableView() {
        tableView.reloadData()
    }
    
    func prepareTableView() {
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.frame = view.bounds
        tableView.rowHeight = 160

        tableView.register(MovieTableViewCell.self, forCellReuseIdentifier: MovieTableViewCell.reuseID)
    }
    
    func showIndicator() {
        showLoadingView()
    }
    
    func dismissIndicator() {
        dismissLoadingView()
    }
}

extension MovieVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.movies?.movieResults?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MovieTableViewCell.reuseID) as! MovieTableViewCell
        let movie = viewModel.movies?.movieResults?[indexPath.row]
        let image = APIEndpoints.imagePath(image: movie?.posterPath ?? "")
        cell.set(title: movie?.title ?? "", release: movie?.releaseDate ?? "", image: image )
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let movie = viewModel.movies?.movieResults?[indexPath.row] else { return }
        let destVC = MovieInfoVC()
        destVC.delegate = self
        destVC.getMovieDatas(movie: movie)
        let navController = UINavigationController(rootViewController: destVC)
        present(navController, animated: true)
    }
}

extension MovieVC: MovieVCDelegate {}

// will be updated
extension MovieVC:  UISearchResultsUpdating, UISearchBarDelegate {
    func updateSearchResults(for searchController: UISearchController) {

    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {

    }
}
