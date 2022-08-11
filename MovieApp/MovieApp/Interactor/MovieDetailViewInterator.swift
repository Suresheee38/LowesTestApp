//
//  MovieDetailViewInterator.swift
//  MovieApp
//
//  Created by Suresh kumar Vijayakumar on 8/13/22.
//

import Foundation
import UIKit

///
/// MovieDetailViewInteractor
/// All calls to get data for Movies details page goes here
///

typealias ImageDownloadableType =  (Result<Data, Error>) -> ()
protocol MoviesDetailInteracting {
    func loadImage(url: String, completion: @escaping  ImageDownloadableType)
}

struct MovieDetailViewInteractor: MoviesDetailInteracting {
    let services: ImageDownloadable
    
    init(services: ImageDownloadable) {
        self.services = services
    }
    
    func loadImage(url: String, completion: @escaping  ImageDownloadableType) {
        services.loadImage(
            urlRequest: ImageURLRequest(
                urlPath: url,
                completion: { result in
                    completion(result)
                }
            )
        )
    }
}
