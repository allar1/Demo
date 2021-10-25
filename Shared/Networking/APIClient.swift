//
//  ApiClient.swift
//  Demo (iOS)
//
//  Created by Allar Anijago on 19/10/21.
//

import Foundation
import Combine

struct APIClient {
    private static let baseURL = URL(string: "https://jsonplaceholder.typicode.com/users")
    
    static let shared = APIClient()
    
    
    func execute<T: Codable>(request: URLRequestConvertible) -> AnyPublisher<T, Error> {
        URLSession.shared
            .dataTaskPublisher(for: request.asURLRequest())
            .map(\.data)
            .decode(type: T.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}
