//
//  CreateUserRepository.swift
//  Demo (iOS)
//
//  Created by Allar Anijago on 15/10/21.
//

import Foundation
import Combine

protocol CreateUserRepositoryProtocol {
    func trackScreenAppear()
    func createUser(name: String, age: String) -> AnyPublisher<User, Error>
}

struct CreateUserRepository: CreateUserRepositoryProtocol {
    func trackScreenAppear() {
        //Analytics.send(Event.
    }
    
    func createUser(name: String, age: String) -> AnyPublisher<User, Error> {
        Just(User(id: 123, name: "Mock user"))
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
}
