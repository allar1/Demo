//
//  UsersView.swift
//  Demo
//
//  Created by Allar Anijago on 13/10/21.
//

import SwiftUI
import Combine

struct UsersView: View {
    @ObservedObject var viewModel: UsersViewModel
    
    var body: some View {
        List(viewModel.users) { user in
            NavigationLink(destination: UsersRouter.detailDestination(user: user)) {
                Text(user.name)
            }
        }
        .navigationTitle("Users")
        .onAppear(perform: viewModel.onAppear)
    }
}

struct UsersView_Previews: PreviewProvider {
    struct MockUsersRepository: UsersRepositoryProtocol {
        func fetchUsers() -> AnyPublisher<[User], Error> {
            Just([User(id: 123, name: "Mock user")])
                .setFailureType(to: Error.self)
                .eraseToAnyPublisher()
        }
    }
    
    static var previews: some View {
        UsersView(viewModel: .init(repostitory: MockUsersRepository()))
    }
}
