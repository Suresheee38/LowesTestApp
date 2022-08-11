//
//  MovieViewsBuilder.swift
//  MovieApp
//
//  Created by Suresh kumar Vijayakumar on 8/11/22.
//


import Foundation
import UIKit

protocol MovieViewsBuilding {
    func buildMoviesSearchComponent() -> UIViewController?
    func buildMoviesSearchDetailsComponent(with dependeny: Dependency) -> UIViewController?
}

///
/// MovieViewsBuilder
/// Build UI Components
///

class MovieViewsBuilder: MovieViewsBuilding {
    private let routing: MoviesAppRouting
    
    private enum Constants {
        static let moviesSearchViewControllerId = "MoviesSearchViewController"
        static let moviesDetailViewControllerId = "DetailsViewController"
    }
    
    private lazy var appStoryBoard: UIStoryboard = {
        return UIStoryboard(name: "Main", bundle: nil)
    }()
    
    init(routing: MoviesAppRouting) {
        self.routing = routing
    }
    
    /// Search View
    func buildMoviesSearchComponent() -> UIViewController? {
        let viewController = appStoryBoard.instantiateViewController(withIdentifier: Constants.moviesSearchViewControllerId) as? MoviesSearchViewController
        viewController?.presenter = MoviesSearchViewPresenter(
            view: viewController,
            router: routing,
            interactor: MovieSearchInteractor(
                services: MovieAppRepository(
                    apiExecuter: APIExecuter()
                )
            )
        )
        return viewController
    }
    
    /// Details View
    func buildMoviesSearchDetailsComponent(with dependency: Dependency) -> UIViewController? {
        let viewController = appStoryBoard.instantiateViewController(withIdentifier: Constants.moviesDetailViewControllerId) as? DetailsViewController
        viewController?.presenter = MovieDetailViewPresenter(
            view: viewController,
            router: routing,
            interactor: MovieDetailViewInteractor(
                services: MovieAppRepository(
                    apiExecuter: APIExecuter()
                )
            ), dependency: dependency
        )
        return viewController
    }
}
