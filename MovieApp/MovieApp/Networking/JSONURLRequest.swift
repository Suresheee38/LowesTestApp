//
//  JSONURLRequest.swift
//  MovieApp
//
//  Created by Suresh kumar Vijayakumar on 8/13/22.
//

import Foundation

///
/// JSONURLRequest - Used to create JSON request
/// T - Generic type model object
/// completion - send result back to caller
///

struct JSONURLRequest<T: Codable> {
    var request: URLRequest?
    let queryParams: Parameters?
    let urlPath: URLPath
    let completion: (Result<T, Error>) -> ()
    
    init(
        queryParams: Parameters? = nil,
        urlPath: URLPath,
        completion: @escaping (Result<T, Error>) -> ()
    ) {
        self.queryParams = queryParams
        self.urlPath = urlPath
        self.completion = completion
        guard let url = url else {
            return
        }
        request = URLRequest(url: url)
    }
}

/// MARK:- URLRequestable Methods
extension JSONURLRequest: URLRequestable {
    private var url: URL? {
        let urlParams = queryParams?.compactMap({ (key, value) -> String in
            return "\(key)=\(value)"
        }).joined(separator: "&") ?? ""
        var urlString = "?" + urlParams
        if let url = urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) {
            urlString = url
        }
        guard let url = URL(string: urlPath.path + urlString) else {
            return nil
        }
        return url
    }
    
    /// OnRequestComplete
    /// Method called once request completed executing
    /// Parameters: data
    func didCompleteRequest(with data: Data?) {
        guard let responseData = data else {
            return
        }
        do {
            let responseModel = try JSONDecoder().decode(T.self, from: responseData)
            completion(Result.success(responseModel))
        } catch {
            print(error)
        }
    }
}

extension Encodable {
    var dictionary: [String: Any]? {
        guard let data = try? JSONEncoder().encode(self) else { return nil }
        return (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)).flatMap { $0 as? [String: Any] }
    }
}
