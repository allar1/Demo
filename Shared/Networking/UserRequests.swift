//
//  UserAPIRequests.swift
//  Demo (iOS)
//
//  Created by Allar Anijago on 19/10/21.
//

import Foundation

enum UserRequests: URLRequestConvertible {
    case getUsers
    
    var method: HTTPMethod {
        .get
    }
    
    var path: String {
        "/users"
    }
}
