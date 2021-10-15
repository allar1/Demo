//
//  UserTests.swift
//  Tests iOS
//
//  Created by Allar Anijago on 13/10/21.
//

import Foundation
import Combine
import XCTest

@testable import Demo

class UserTests: XCTestCase {
    
    var mockRepository: MockUsersRepostitory!
    var viewModel: UsersViewModel!
    
    override func setUpWithError() throws {
        mockRepository = MockUsersRepostitory()
        viewModel = UsersViewModel(repostitory: mockRepository)
    }

    func testX() throws {

    }
}

struct MockUsersRepostitory: UsersRepositoryProtocol {
    func fetchUsers() -> AnyPublisher<[User], Error> {
        Just([User(name: "Mock user")])
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
}
