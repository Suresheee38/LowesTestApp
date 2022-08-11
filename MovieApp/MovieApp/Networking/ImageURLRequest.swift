//
//  ImageURLRequest.swift
//  MovieApp
//
//  Created by Suresh kumar Vijayakumar on 8/13/22.
//

import Foundation

///
/// ImageURLRequest
/// Used to create ImageDownload request
/// completion - send result back to caller
///
///
struct ImageURLRequest {
    var request: URLRequest?
    let urlPath: String
    let completion: (Result<Data, Error>) -> ()
    
    init(
        queryParams: Parameters? = nil,
        urlPath: String,
        completion: @escaping (Result<Data, Error>) -> ()
    ) {
        self.urlPath = urlPath
        self.completion = completion
        guard let url = url else {
            return
        }
        request = URLRequest(url: url)
    }
}

/// MARK:- URLRequestable Methods
extension ImageURLRequest: URLRequestable {
    private var url: URL? {
        guard let url = URL(string: urlPath) else {
            return nil
        }
        return url
    }
    
    /// OnRequestComplete 
    /// Method called once request completed executing
    /// Parameters: data
    func didCompleteRequest(with data: Data?) {
        guard let data = data else {
            return
        }
        completion(Result.success(data))
    }
}
