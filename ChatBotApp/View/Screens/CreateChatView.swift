//
//  CreateChat.swift
//  ChatBotApp
//
//  Created by Yuriy Pashkov on 22.12.2023.
//

import SwiftUI

struct CreateChatView: View {
    var body: some View {
        NavigationStack {
            VStack {
                // shitty warn
                Text("Hello. This is a simple ChatGPT-bot. To start chat please tap button below.")
                    .multilineTextAlignment(.center)
                NavigationLink {
                    ChatView()
                        .toolbar(.hidden, for: .tabBar)
                } label: {
                    Text("Start dialog")
                }

            }
            .navigationTitle("ChatBot")
            .navigationBarTitleDisplayMode(.inline)
        }
        
    }
}

#Preview {
    CreateChatView()
}
