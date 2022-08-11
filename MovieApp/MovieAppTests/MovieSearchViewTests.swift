//
//  MovieSearchViewTests.swift
//  MovieAppTests
//
//  Created by Suresh kumar Vijayakumar on 8/13/22.
//

import XCTest
@testable import MovieApp

class MovieSearchViewTests: XCTestCase {

    var presenter: MoviesSearchViewPresenter!
    var router: MockRouter!
    var interactor: MockInteractor!
    var view: MockView!

    override func setUpWithError() throws {
        router = MockRouter()
        interactor = MockInteractor()
        view = MockView()
        presenter = MoviesSearchViewPresenter(
            view: view,
            router: router,
            interactor: interactor
        )
    }
    
    func testRouter() {
        
        //given
        presenter.movie = mockMovie
        presenter.config = mockConfig
        
        // when
        presenter.didSelect(atIndex: IndexPath(row: 0, section: 0))
        
        //then
        guard case .pushToDetails = router.calledMethods.first else {
            XCTFail("Not pushed to detail")
            return
        }
        XCTAssert(router.calledMethods.first == .pushToDetails)
    }
    
    func testInteractor() {
        // when
        presenter.fetchMovies()
        
        //then
        guard case .getMoviesAndConfig = interactor.calledMethods.first else {
            XCTFail("Not details are fetched")
            return
        }
        XCTAssert(interactor.calledMethods.first == .getMoviesAndConfig)
    }
    
    func testView() {
        // when
        presenter.fetchMovies()
        
        //then
        guard case .showLoading = view.calledMethods.first else {
            XCTFail("Not details are fetched")
            return
        }
        XCTAssert(interactor.calledMethods.first == .getMoviesAndConfig)
        XCTAssert(view.calledMethods.contains(.hideLoading))
    }
}

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

class MockInteractor: MoviesSearchInteracting {
    enum Methods {
        case getMoviesAndConfig
    }
    
    var calledMethods: [Methods] = []
    
    func getMoviesAndConfig(completion: @escaping (Movie?, Config?) -> ()) {
        calledMethods.append(.getMoviesAndConfig)
        completion(mockMovie, mockConfig)
    }
}

class MockView: MovieSearchViewing {
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

let mockMovie =  Movie(page: 0, results: [MovieResult(adult: false, backdropPath: nil, genreIDS: nil, id: 0, originalLanguage: "en-US", originalTitle: "", overview: "", popularity: 0.0, posterPath: "", releaseDate: "", title: "", video: true, voteAverage: 0.0, voteCount: 0)], totalPages: 0, totalResults: 0)
let mockConfig = Config(images: Images(baseURL: "", secureBaseURL: "", backdropSizes: [], logoSizes: [], posterSizes: [], profileSizes: [], stillSizes: []), changeKeys: [])
