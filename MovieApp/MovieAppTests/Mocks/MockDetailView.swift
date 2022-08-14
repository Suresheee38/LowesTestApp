//
//  MockDetailView.swift
//  MovieAppTests
//
//  Created by Suresh kumar Vijayakumar on 8/14/22.
//

import Foundation
@testable import MovieApp

class MockDetailView: MovieDetailViewing {
    func loadImageViewAsync(image: Data) {
        calledMethods.append(.loadImageViewAsync)
    }
    
    func loadViews() {
        calledMethods.append(.loadViews)
    }
    
    enum Methods {
        case loadImageViewAsync
        case loadViews
    }
    var calledMethods: [Methods] = []
}
