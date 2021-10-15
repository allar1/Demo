//
//  UserViewModel.swift
//  Demo
//
//  Created by Allar Anijago on 13/10/21.
//

import Foundation
import Combine

final class UsersViewModel: ObservableObject {
    private let repostitory: UsersRepositoryProtocol
    private var subscriptions = Set<AnyCancellable>()
    
    @Published var users = [User]()
    
    init(repostitory: UsersRepositoryProtocol = UsersRepository()) {
        self.repostitory = repostitory
    }
    
    func onAppear() {
        repostitory.fetchUsers()
            .receive(on: DispatchQueue.main)
            .sink { completion in
                if case let .failure(error) = completion {
                    print(error)
                }
            } receiveValue: { users in
                self.users = users
            }
            .store(in: &subscriptions)
    }
}
