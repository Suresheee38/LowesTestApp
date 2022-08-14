//
//  MoviesSearchViewPresenter.swift
//  MovieApp
//
//  Created by Suresh kumar Vijayakumar on 8/12/22.
//

import Foundation
protocol MoviesSearchViewPresenting {
    func fetchMovies(for keyword: String?)
    func didSelect(atIndex: IndexPath)
    var movie: Movie? { get set }
    var config: Config? { get set }
}

///
/// MoviesSearchViewPresenter
/// All interactions and data flows for search page starts here
///

final class MoviesSearchViewPresenter {
    private weak var view: MovieSearchViewing?
    private let router: MoviesAppRouting
    private let interactor: MoviesSearchInteracting
    
    var movie: Movie? {
        didSet {
            view?.loadData()
        }
    }
    
    var config: Config?
    
    init(
        view: MovieSearchViewing?,
        router: MoviesAppRouting,
        interactor: MoviesSearchInteracting
    ) {
        self.view = view
        self.router = router
        self.interactor = interactor
    }
}

///MARK:- MoviesSearchViewPresenting Methods
extension MoviesSearchViewPresenter: MoviesSearchViewPresenting {
    func fetchMovies(for keyword: String?) {
        guard let keyword = keyword, !keyword.isEmpty else {
            return
        }
        view?.showLoading()
        interactor.getMoviesAndConfig(for: keyword) { [weak self] movie, config in
            guard let strongSelf = self else {
                return
            }
            strongSelf.view?.hideLoading()
            strongSelf.movie = movie
            strongSelf.config = config
        }
    }
    
    func didSelect(atIndex indexpath: IndexPath) {
        guard let movie = movie, let config = config, !movie.results.isEmpty else {
            return
        }
        router.pushToDetails(
            dependency: Dependency(
                movieResult: movie.results[indexpath.row],
                config: config
            )
        )
    }
}
