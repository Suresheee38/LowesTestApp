//
//  MockSearchViewInteractor.swift
//  MovieAppTests
//
//  Created by Suresh kumar Vijayakumar on 8/14/22.
//

@testable import MovieApp

class MockSearchViewInteractor: MoviesSearchInteracting {
    enum Methods {
        case getMoviesAndConfig
    }
    
    var calledMethods: [Methods] = []
    
    func getMoviesAndConfig(for key: String, completion: @escaping (Movie?, Config?) -> ()) {
        calledMethods.append(.getMoviesAndConfig)
        completion(mockMovie, mockConfig)
    }
}
