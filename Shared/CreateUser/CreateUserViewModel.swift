//
//  CreateUserViewModel.swift
//  Demo (iOS)
//
//  Created by Allar Anijago on 15/10/21.
//

import Foundation
import Combine

final class CreateUserViewModel: ObservableObject {
    private let repostitory: CreateUserRepositoryProtocol
    private var subscriptions = Set<AnyCancellable>()
    
    @Published var name: String = ""
    @Published var nameValidation: ValidationState = .success
    @Published var age: String = ""
    @Published var ageValidation: ValidationState = .success
    @Published var isUserCreated: Bool = false

    init(repostitory: CreateUserRepositoryProtocol = CreateUserRepository()) {
        self.repostitory = repostitory
        
        $name
            .dropFirst()
            .map {
                self.validateName(name: $0)
            }
            .assign(to: \.nameValidation, on: self)
            .store(in: &subscriptions)
        
        $age
            .dropFirst()
            .debounce(for: 0.5, scheduler: DispatchQueue.main)
            .map {
                self.validateAge(age: $0)
            }
            .assign(to: \.ageValidation, on: self)
            .store(in: &subscriptions)
    }
    
    func onAppear() {
        repostitory.trackScreenAppear()
    }
    
    func validate() -> Bool {
        nameValidation = validateName(name: name)
        ageValidation = validateAge(age: age)
        
        return nameValidation.isValid && ageValidation.isValid
    }
    
    func save() {
        guard validate() else {
            return
        }
        
        repostitory.createUser(name: name, age: age)
            .receive(on: DispatchQueue.main)
            .sink { completion in
                if case let .failure(error) = completion {
                    print(error)
                }
            } receiveValue: { _ in
                self.isUserCreated = true
            }
            .store(in: &subscriptions)
    }
    
    func validateName(name: String) -> ValidationState {
        name.isEmpty ? .error(message: "Please enter your name!") : .success
    }
    
    func validateAge(age: String) -> ValidationState {
        guard !age.isEmpty else {
            return .error(message: "Please enter your age!")
        }
        guard let age = Int(age), age >= 18 else {
            return .error(message: "You must be at least 18 years old!")
        }
    
        return .success
    }
}
