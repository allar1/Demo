//
//  UsersRepository.swift
//  Demo
//
//  Created by Allar Anijago on 13/10/21.
//

import Foundation
import Combine

protocol UsersRepositoryProtocol {
    func fetchUsers() -> AnyPublisher<[User], Error>
}

struct UsersRepository: UsersRepositoryProtocol {
    func fetchUsers() -> AnyPublisher<[User], Error> {
        APIClient.shared.execute(request: UserRequests.getUsers)
    }
}
