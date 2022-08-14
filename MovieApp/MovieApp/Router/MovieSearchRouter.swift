//
//  MovieSearchRouter.swift
//  MovieApp
//
//  Created by Suresh kumar Vijayakumar on 8/12/22.
//

import Foundation
import UIKit

protocol MoviesAppRouting {
    func pushToDetails(dependency: Dependency)
    func pop()
}

protocol Navigatable {
    func show(_ viewController: UIViewController, animated: Bool)
    func pop(animated: Bool)
}

///
/// MovieSearchRouter
/// All navigation goes here via 'Navigatable' type
///
struct MovieSearchRouter {
    private var navigation: Navigatable
    
    init(navigation: Navigatable) {
        self.navigation = navigation
    }
}

///MARK:- MoviesAppRouting Methods
extension MovieSearchRouter: MoviesAppRouting {
    func pushToDetails(dependency: Dependency) {
        let builder = MovieViewsBuilder(routing: self)
        guard let viewController = builder.buildMoviesSearchDetailsComponent(with: dependency) else {
            return
        }
        navigation.show(viewController, animated: true)
    }
    
    func pop() {
        navigation.pop(animated: true)
    }
}
