//
//  URLRequestConvertible.swift
//  Demo (iOS)
//
//  Created by Allar Anijago on 19/10/21.
//

import Foundation

enum RequestError: String, Error {
    case invalidURL = "invalid url"
}

protocol URLRequestConvertible {
    var host: URL { get }
    var method: HTTPMethod { get }
    var path: String { get }
    
    func asURLRequest() -> URLRequest
}

extension URLRequestConvertible {
    var host: URL {
        URL(string: "https://jsonplaceholder.typicode.com")!
    }
    
    func asURLRequest() -> URLRequest {
        var urlRequest = URLRequest(url: host.appendingPathComponent(path))
        urlRequest.httpMethod = method.rawValue
        
        return urlRequest
    }
}
