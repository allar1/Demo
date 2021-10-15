//
//  UserDetailView.swift
//  Demo (iOS)
//
//  Created by Allar Anijago on 15/10/21.
//

import SwiftUI

struct UserDetailView: View {
    @ObservedObject var viewModel: UserDetailViewModel

    var body: some View {
        Text(viewModel.user.name)
            .navigationTitle("Hello :)")
    }
}

struct UserDetailView_Previews: PreviewProvider {
    static var previews: some View {
        UserDetailView(viewModel: .init(user: User.fake()))
    }
}
