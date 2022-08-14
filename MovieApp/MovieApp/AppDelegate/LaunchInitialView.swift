//
//  LaunchInitialView.swift
//  MovieApp
//
//  Created by Suresh kumar Vijayakumar on 8/11/22.
//

import Foundation
import UIKit

protocol Launchable {
    func launch()
}

struct LaunchInitialView {
    private var window: UIWindow?
    
    init(window: UIWindow?) {
        self.window = window
    }
}

// MARK:- Launchable Methods
extension LaunchInitialView: Launchable {
    func launch() {
        let navigationController = UINavigationController()
        let router = MovieSearchRouter(navigation: navigationController)
        let appBuilder = MovieViewsBuilder(routing: router)
        guard let window = window, let initialViewController = appBuilder.buildMoviesSearchComponent() as? MoviesSearchViewController else {
            return
        }
        
        //Set navigation bar appearance
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        let appearance = UINavigationBarAppearance()
        appearance.configureWithDefaultBackground()
        appearance.backgroundColor = UIColor.systemCyan
        appearance.titleTextAttributes = textAttributes
        navigationController.navigationBar.tintColor = .white
        navigationController.navigationBar.standardAppearance = appearance
        navigationController.navigationBar.scrollEdgeAppearance = navigationController.navigationBar.standardAppearance
        
        navigationController.setViewControllers([initialViewController], animated: true)
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
}
