//
//  MockSearchView.swift
//  MovieAppTests
//
//  Created by Suresh kumar Vijayakumar on 8/14/22.
//

@testable import MovieApp

class MockSearchView: MovieSearchViewing {
    enum Methods {
        case loadData
        case showLoading
        case hideLoading
    }
    
    var calledMethods: [Methods] = []
    
    func loadData() {
        calledMethods.append(.loadData)
    }
    
    func showLoading() {
        calledMethods.append(.showLoading)
    }
    
    func hideLoading() {
        calledMethods.append(.hideLoading)
    }
}
