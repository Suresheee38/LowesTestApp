//
//  APIExecuter.swift
//  MovieApp
//
//  Created by Suresh kumar Vijayakumar on 8/12/22.
//

import Foundation

///
/// APIExecuter - Used to execute requests of type 'URLRequestable'
///

protocol APIExecutable {
    func execute(request: URLRequestable)
}

protocol URLRequestable {
    var request: URLRequest? { get set }
    func didCompleteRequest(with data: Data?)
}

struct APIExecuter: APIExecutable {
    
    /// Execute URLSession task
    /// Parameters: request of any type implements 'URLRequestable'
    
    func execute(request: URLRequestable) {
        guard let unwrappedRequest = request.request else  {
            return
        }
        let task = URLSession.shared.dataTask(with: unwrappedRequest) { data, response, error in
            if let data = data {
                request.didCompleteRequest(with: data)
            } else if let error = error {
                print("Request Failed \(error)")
            }
        }
        task.resume()
    }
}
