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
    func pushViewControllerNavigatable(_ viewController: UIViewController, animated: Bool)
    func popViewControllerNavigatable(animated: Bool)
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
        navigation.pushViewControllerNavigatable(viewController, animated: true)
    }
    
    func pop() {
        navigation.popViewControllerNavigatable(animated: true)
    }
}

///MARK:- Navigatable Methods
extension UINavigationController: Navigatable {
    func popViewControllerNavigatable(animated: Bool) {
        popViewController(animated: animated)
    }
    
    func pushViewControllerNavigatable(_ viewController: UIViewController, animated: Bool) {
        pushViewController(viewController, animated: true)
    }
}
