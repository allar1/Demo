//
//  CreateUserView.swift
//  Demo (iOS)
//
//  Created by Allar Anijago on 15/10/21.
//

import SwiftUI

struct CreateUserView: View {
    @ObservedObject var viewModel: CreateUserViewModel
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                DTextField("Name", text: $viewModel.name, validation: $viewModel.nameValidation)
                
                DTextField("Age", text: $viewModel.age, validation: $viewModel.ageValidation)
                    .keyboardType(.numberPad)
                
                Spacer()
            }
            .padding()
            .navigationTitle("Create User")
            .toolbar {
                NavigationLink(isActive: $viewModel.isUserCreated, destination: CreateUserRouter.usersDestination) {
                    Button("Save", action: viewModel.save)
                }
            }
        }
        .onAppear(perform: viewModel.onAppear)
    }
}

struct CreateUserView_Previews: PreviewProvider {
    static var previews: some View {
        CreateUserView(viewModel: .init())
    }
}
