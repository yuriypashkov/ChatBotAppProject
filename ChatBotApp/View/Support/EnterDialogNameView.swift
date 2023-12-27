//
//  EnterDialogNameView.swift
//  ChatBotApp
//
//  Created by Yuriy Pashkov on 24.12.2023.
//

import SwiftUI

struct EnterDialogNameView: View {
    // binding var for pass entered title
    @Binding var text: String
    // dismiss current view
    @Environment(\.dismiss) private var dismiss
    // pass done button action
    var doneButtonAction: (() -> Void)?
    
    var body: some View {
        GeometryReader { reader in
            VStack {
                VStack {
                    Text("Please enter the dialog name")
                    TextField("Enter somewhere...", text: $text, axis: .horizontal)
                        .padding(8)
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(12)
                    HStack {
                        Button {
                            dismiss()
                        } label: {
                            Text("Cancel")
                                .padding()
                                .foregroundColor(.red)
                        }
                        Button {
                            doneButtonAction?()
                        } label: {
                            Text("Done")
                                .padding()
                        }
                    }
                }
                .frame(maxWidth: reader.size.width - 64)
                .padding()
                .background(Color.white)
                .cornerRadius(20)
                .shadow(radius: 20)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.gray.opacity(0.3))
        }
    }
}

#Preview {
    EnterDialogNameView(text: .constant("some text"))
}
