//
//  UsersView.swift
//  Demo
//
//  Created by Allar Anijago on 13/10/21.
//

import SwiftUI

struct UsersView: View {
    @ObservedObject var viewModel: UsersViewModel
    
    var body: some View {
        NavigationView {
            List(viewModel.users) { user in
                NavigationLink(destination: UserDetailView(viewModel: .init(user: user))) {
                    Text(user.name)
                }
            }
            .navigationTitle("Users")
        }
        .onAppear(perform: viewModel.onAppear)
    }
}

struct UsersView_Previews: PreviewProvider {
    static var previews: some View {
        UsersView(viewModel: .init())
    }
}
