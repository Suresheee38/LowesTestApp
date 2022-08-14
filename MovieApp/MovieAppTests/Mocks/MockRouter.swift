//
//  MockRouter.swift
//  MovieAppTests
//
//  Created by Suresh kumar Vijayakumar on 8/14/22.
//

import Foundation
@testable import MovieApp

class MockRouter: MoviesAppRouting {
    enum Methods {
        case pushToDetails
        case pop
    }
    
    var calledMethods: [Methods] = []
    
    func pushToDetails(dependency: Dependency) {
        calledMethods.append(.pushToDetails)
    }
    
    func pop() {
        calledMethods.append(.pop)
    }
}
