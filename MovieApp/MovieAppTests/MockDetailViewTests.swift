//
//  MockDetailViewTests.swift
//  MovieAppTests
//
//  Created by Suresh kumar Vijayakumar on 8/14/22.
//

import XCTest
@testable import MovieApp

class MockDetailViewTests: XCTestCase {

    var presenter: MovieDetailViewPresenter!
    var router: MockRouter!
    var interactor: MockDetailViewInteractor!
    var view: MockDetailView!

    override func setUpWithError() throws {
        router = MockRouter()
        interactor = MockDetailViewInteractor()
        view = MockDetailView()
        presenter = MovieDetailViewPresenter(
            view: view,
            router: router,
            interactor: interactor,
            dependency: Dependency(
                movieResult: mockMovie.results.first!,
                config: mockConfig
            )
        )
    }
    
    func testInteractor() {
        // when
        presenter.loadAllViews()
        
        //then
        guard case .loadImage = interactor.calledMethods.first else {
            XCTFail("load image method not called")
            return
        }
        XCTAssert(interactor.calledMethods.first == .loadImage)
    }
    
    func testView() {
        // when
        presenter.loadAllViews()
        
        //then
        guard case .loadViews = view.calledMethods.first else {
            XCTFail("No load methods called")
            return
        }
        XCTAssert(view.calledMethods.contains(.loadViews))
        XCTAssertNotNil(presenter.movieTitle)
        XCTAssertNotNil(presenter.imagePosterPath)
        XCTAssertNotNil(presenter.movieReleaseDate)
        XCTAssert(view.calledMethods.contains(.loadImageViewAsync))
    }
}

