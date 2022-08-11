//
//  MovieAppRepository.swift
//  MovieApp
//
//  Created by Suresh kumar Vijayakumar on 8/12/22.
//

import Foundation
import UIKit

typealias MovieSearchResultType = Result<Movie, Error>
typealias ConfigResultType = Result<Config, Error>
typealias MoviesAPICompletionType = (MovieSearchResultType) -> ()
typealias ConfigAPICompletionType = (ConfigResultType) -> ()
typealias Parameters = [String: Any]

protocol MovieAppRepositoryCallable {
    func fetchmovies(
        with request: MovieAppRequestModels.FetchMovie,
        completion: @escaping MoviesAPICompletionType
    )
    func fetchConfig(
        with request: MovieAppRequestModels.FetchConfig,
        completion: @escaping ConfigAPICompletionType
    )
}

protocol ImageDownloadable {
    func loadImage(urlRequest: ImageURLRequest)
}

/// URL configuration
enum URLPath {
    case search
    case config
    
    var path: String {
        let basePath = "https://api.themoviedb.org/3"
        switch self {
        case .search:
            return basePath + "/search/movie"
        case .config:
            return basePath + "/configuration"
        }
    }
}


///
/// MovieAppRepository - Common repository for the App
/// All service calls interface declared and implemented here
///

class MovieAppRepository {
    var apiExecuter: APIExecutable
    
    init(apiExecuter: APIExecutable) {
        self.apiExecuter = apiExecuter
    }
}

///MARK:- MovieAppRepositoryCallable Methods
extension MovieAppRepository: MovieAppRepositoryCallable {
    func fetchmovies(
        with request: MovieAppRequestModels.FetchMovie,
        completion: @escaping MoviesAPICompletionType
    ) {
        let dictionary = request.dictionary
        let jsonRequest = JSONURLRequest(
            queryParams: dictionary,
            urlPath: .search,
            completion: completion
        )
        apiExecuter.execute(request: jsonRequest)
    }
    
    func fetchConfig(
        with request: MovieAppRequestModels.FetchConfig,
        completion: @escaping ConfigAPICompletionType
    ) {
        let dictionary = request.dictionary
        let jsonRequest = JSONURLRequest(
            queryParams: dictionary,
            urlPath: .config,
            completion: completion
        )
        apiExecuter.execute(request: jsonRequest)
    }
}

///MARK:- ImageDownloadable Methods
extension MovieAppRepository: ImageDownloadable {
    func loadImage(urlRequest: ImageURLRequest) {
        apiExecuter.execute(request: urlRequest)
    }
}
