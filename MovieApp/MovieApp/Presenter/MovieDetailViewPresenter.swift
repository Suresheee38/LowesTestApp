//
//  MovieDetailViewPresenter.swift
//  MovieApp
//
//  Created by Suresh kumar Vijayakumar on 8/13/22.
//

import Foundation

protocol MoviesDetailViewPresenting {
    var movieTitle: String { get }
    var movieOverView: String { get }
    var movieReleaseDate: String { get }
    var imagePosterPath: String { get }
    func loadAllViews()
}

struct Dependency {
    let movieResult: MovieResult
    let config: Config
}

///
/// MovieDetailViewPresenter
/// All interactions and data flows for details page starts here
///

final class MovieDetailViewPresenter: MoviesDetailViewPresenting {
    private let router: MoviesAppRouting
    private let interactor: MoviesDetailInteracting
    private weak var view: MovieDetailViewing?
    private let dependency: Dependency
    
    init(
        view: MovieDetailViewing?,
        router: MoviesAppRouting,
        interactor: MoviesDetailInteracting,
        dependency: Dependency
    ) {
        self.view = view
        self.router = router
        self.interactor = interactor
        self.dependency = dependency
    }
    
    /// Movie title
    var movieTitle: String {
        return dependency.movieResult.originalTitle ?? ""
    }
    
    /// Movie overview
    var movieOverView: String {
        return dependency.movieResult.overview ?? ""
    }
    
    /// Movie release date
    var movieReleaseDate: String {
        return dependency.movieResult.releaseDate?.getFormattedDate() ?? ""
    }
    
    /// Image path
    var imagePosterPath: String {
        let imageObj = dependency.config.images
        guard let posterPath = dependency.movieResult.posterPath, let url = imageObj.secureBaseURL else {
            return ""
        }
        let size = imageObj.backdropSizes?.first { $0 == "original"} ?? ""
        return "\(url)\(size)\(posterPath)"
    }
    
    /// Load views initially and load image aynchronously
    func loadAllViews() {
        view?.loadViews()
        interactor.loadImage(url: imagePosterPath) { [weak self] result in
            if let data = try? result.get() {
                self?.view?.loadImageViewAsync(image: data)
            }
        }
    }
}
