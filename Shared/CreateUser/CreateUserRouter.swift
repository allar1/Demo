//
//  CreateUserRouter.swift
//  Demo
//
//  Created by Allar Anijago on 19/10/21.
//

import SwiftUI

final class CreateUserRouter {
    static func usersDestination() -> some View {
        UsersView(viewModel: .init())
    }
}
