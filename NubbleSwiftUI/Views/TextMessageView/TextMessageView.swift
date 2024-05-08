//
//  TextMessageView.swift
//  NubbleSwiftUI
//
//  Created by Willian Peres on 08/05/24.
//

import SwiftUI

struct TextMessageView: View {
    let placeholder: String
    let onSubmit: () -> Void
    
    init(placeholder: String = "Adicione um comentário", onSubmit: @escaping () -> Void) {
        self.placeholder = placeholder
        self.onSubmit = onSubmit
    }
    
    @State private var message = ""
    @FocusState private var messageFieldIsFocused: Bool
    
    var body: some View {
        HStack(spacing: 0) {
            TextField(placeholder, text: $message)
                .textInputAutocapitalization(.never)
                .disableAutocorrection(true)
                .focused($messageFieldIsFocused)
                .padding(.horizontal, 16)
            
            Button {
                onSubmit()
            } label: {
                Text("Enviar")
                    .font(.footnote)
                    .fontWeight(.bold)
            }
            .buttonStyle(.plain)
            .padding(.vertical, 18)
            .padding(.horizontal, 16)
        }
        .cornerRadius(12 + 1)
        .overlay(
            RoundedRectangle(cornerSize: CGSize(width: 12, height: 12))
                .inset(by: 1)
                .stroke(.tertiary, lineWidth: 1)
        )
        .onTapGesture {
            messageFieldIsFocused = true
        }
    }
}

#Preview {
    TextMessageView {
        print("Submitted")
    }
}
