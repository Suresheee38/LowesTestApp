//
//  MovieSearchViewTests.swift
//  MovieAppTests
//
//  Created by Suresh kumar Vijayakumar on 8/13/22.
//

import XCTest
@testable import MovieApp


let mockMovie =  Movie(page: 0, results: [MovieResult(adult: false, backdropPath: nil, genreIDS: nil, id: 0, originalLanguage: "en-US", originalTitle: "title", overview: "overview", popularity: 0.0, posterPath: "https://someurl", releaseDate: "", title: "", video: true, voteAverage: 0.0, voteCount: 0)], totalPages: 0, totalResults: 0)
let mockConfig = Config(images: Images(baseURL: "https://someurl", secureBaseURL: "https://someSecureurl", backdropSizes: ["original"], logoSizes: [], posterSizes: [], profileSizes: [], stillSizes: []), changeKeys: [])

class MovieSearchViewTests: XCTestCase {

    var presenter: MoviesSearchViewPresenter!
    var router: MockRouter!
    var interactor: MockSearchViewInteractor!
    var view: MockSearchView!

    override func setUpWithError() throws {
        router = MockRouter()
        interactor = MockSearchViewInteractor()
        view = MockSearchView()
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
        presenter.fetchMovies(for: "star wars")
        
        //then
        guard case .getMoviesAndConfig = interactor.calledMethods.first else {
            XCTFail("Not details are fetched")
            return
        }
        XCTAssert(interactor.calledMethods.first == .getMoviesAndConfig)
    }
    
    func testInteractorWhenNoInputPassed() {
        // when
        presenter.fetchMovies(for: "")
        
        //then
        XCTAssert(interactor.calledMethods.isEmpty)
    }
    
    func testView() {
        // when
        presenter.fetchMovies(for: "star wars")
        
        //then
        guard case .showLoading = view.calledMethods.first else {
            XCTFail("Not details are fetched")
            return
        }
        XCTAssert(interactor.calledMethods.first == .getMoviesAndConfig)
        XCTAssert(view.calledMethods.contains(.hideLoading))
    }
}
