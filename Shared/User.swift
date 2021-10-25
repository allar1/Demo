//
//  User.swift
//  Demo
//
//  Created by Allar Anijago on 13/10/21.
//

import Foundation

struct User: Codable, Identifiable {
    let id: Int
    let name: String
}

extension User {
    static func fake() -> Self {
        User(id: 123, name: "Fake user")
    }
}
