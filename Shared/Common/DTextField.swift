//
//  DTextField.swift
//  Demo (iOS)
//
//  Created by Allar Anijago on 15/10/21.
//

import SwiftUI

struct DTextField: View {
    let title: String
    
    @Binding var text: String
    @Binding var validation: ValidationState
    
    private let onEditingChanged: (Bool) -> Void
    private let onCommit: () -> Void
    
    public init(
        _ title: String,
        text: Binding<String>,
        validation: Binding<ValidationState>,
        onEditingChanged: @escaping (Bool) -> Void = { _ in },
        onCommit: @escaping () -> Void = { }
    ) {
        self.title = title
        _text = text
        _validation = validation
        self.onEditingChanged = onEditingChanged
        self.onCommit = onCommit
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            TextField(
                title,
                text: $text,
                onEditingChanged: onEditingChanged,
                onCommit: onCommit
            )
                .textFieldStyle(.roundedBorder)
            
            Text(validation.errorMessage ?? " ")
                .foregroundColor(.red)
                .font(.caption)
        }
    }
}

struct DTextField_Previews: PreviewProvider {
    static var previews: some View {
        DTextField("placeholder", text: .constant("text"), validation: .constant(.success))
    }
}
