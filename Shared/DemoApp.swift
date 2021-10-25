//
//  DemoApp.swift
//  Shared
//
//  Created by Allar Anijago on 13/10/21.
//

import SwiftUI

@main
struct DemoApp: App {
    var body: some Scene {
        WindowGroup {
            CreateUserView(viewModel: .init())
        }
    }
}
