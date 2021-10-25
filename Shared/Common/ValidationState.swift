//
//  ValidationState.swift
//  Demo (iOS)
//
//  Created by Allar Anijago on 15/10/21.
//

import Foundation

enum ValidationState {
    case success
    case error(message: String)
    
    var isValid: Bool {
        if case .success = self {
            return true
        }
        return false
    }
    
    var errorMessage: String? {
        if case .error(let message) = self {
            return message
        }
        return nil
    }
}
