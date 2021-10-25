//
//  UsersRouter.swift
//  Demo
//
//  Created by Allar Anijago on 19/10/21.
//

import SwiftUI

final class UsersRouter {
    static func detailDestination(user: User) -> some View {
       UserDetailView(viewModel: .init(user: user))
    }
}
