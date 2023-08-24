//
//  ViewController.swift
//  Movie App
//
//  Created by Mehmet Ali Özdemir on 24.08.2023.
//

import UIKit

final class MainTabbarVC: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        self.setupTabs()
        self.tabBar.barTintColor = .systemBackground
        self.tabBar.tintColor = .systemGray
        self.tabBar.unselectedItemTintColor = .systemGray2

    }

    private func setupTabs(){
        let movies = createNav(with: "Movies", and: UIImage(systemName: "popcorn"), vc: MovieVC())
        movies.title = "Movies"
        let favorites = createNav(with: "Favorites", and: UIImage(systemName: "bookmark"), vc: FavoritesVC())
        favorites.title = "Favorites"
        
        self.setViewControllers([movies, favorites], animated: true)
    }
    
    private func createNav(with title: String, and image: UIImage?, vc: UIViewController) -> UINavigationController {
        let nav = UINavigationController(rootViewController: vc)
        nav.tabBarItem.title = title
        nav.tabBarItem.image = image
        return nav
    }

}

