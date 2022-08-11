//
//  MovieSearchInteractor.swift
//  MovieApp
//
//  Created by Suresh kumar Vijayakumar on 8/12/22.
//

import Foundation

protocol MoviesSearchInteracting {
    func getMoviesAndConfig(completion: @escaping (Movie?, Config?) -> ())
}

///
/// MovieSearchInteractor
/// All calls to get data for Movies search page goes here
///

struct MovieSearchInteractor: MoviesSearchInteracting {
    let services: MovieAppRepositoryCallable
    
    init(services: MovieAppRepositoryCallable) {
        self.services = services
    }
    
    /// Fetch Movies
    private func movies(fetch: @escaping MoviesAPICompletionType) {
        services.fetchmovies(
            with: MovieAppRequestModels.FetchMovie(
                apiKey: "5885c445eab51c7004916b9c0313e2d3",
                keyword: "Star wars"
            )
        ) { result in
            fetch(result)
        }
    }
    
    /// Fetch Config to construct Image URL
    private func config(fetch: @escaping ConfigAPICompletionType) {
        services.fetchConfig(
            with: MovieAppRequestModels.FetchConfig(
                apiKey: "5885c445eab51c7004916b9c0313e2d3"
            )
        ) { result in
            fetch(result)
        }
    }
    
    /// Combine Config & Movie object
    /// Load movie search page
    /// Load Movie details page
    /// 

    func getMoviesAndConfig(completion: @escaping (Movie?, Config?) -> ()) {
        var movie: Movie?
        var configuration: Config?
        
        let group = DispatchGroup()
        group.enter()
        movies { result in
            movie = try? result.get()
            group.leave()
        }
        
        group.enter()
        
        config { result in
            configuration = try? result.get()
            group.leave()
        }
        
        group.notify(queue: DispatchQueue.main) {
            completion(movie, configuration)
        }
    }
}
