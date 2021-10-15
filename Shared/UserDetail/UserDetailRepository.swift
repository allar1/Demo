//
//  UserDetailRepository.swift
//  Demo (iOS)
//
//  Created by Allar Anijago on 15/10/21.
//

import Foundation
import Combine

protocol UserDetailRepositoryProtocol {
    func trackScreenAppear()
}

struct UserDetailRepository: UserDetailRepositoryProtocol {
    func trackScreenAppear() {
        //Analytics.send(Event.
    }
}
