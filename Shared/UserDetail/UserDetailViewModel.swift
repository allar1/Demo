//
//  UserDetailViewModel.swift
//  Demo (iOS)
//
//  Created by Allar Anijago on 15/10/21.
//

import Foundation
import Combine

final class UserDetailViewModel: ObservableObject {
    private let repostitory: UserDetailRepositoryProtocol
    private var subscriptions = Set<AnyCancellable>()
    
    var user: User?
    
    init(user: User, repostitory: UserDetailRepositoryProtocol = UserDetailRepository()) {
        self.user = user
        self.repostitory = repostitory
    }
    
    func onAppear() {
        repostitory.trackScreenAppear()
    }
}
