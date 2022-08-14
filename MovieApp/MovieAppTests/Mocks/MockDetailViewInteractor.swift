//
//  MockDetailViewInteractor.swift
//  MovieAppTests
//
//  Created by Suresh kumar Vijayakumar on 8/14/22.
//

import Foundation
@testable import MovieApp

class MockDetailViewInteractor: MoviesDetailInteracting {
    enum Methods {
        case loadImage
    }
    
    var calledMethods: [Methods] = []
    
    func loadImage(url: String, completion: @escaping ImageDownloadableType) {
        calledMethods.append(.loadImage)
        completion(Result.success(Data()))
    }
}

