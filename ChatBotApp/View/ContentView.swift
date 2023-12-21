//
//  ContentView.swift
//  ChatBotApp
//
//  Created by Yuriy Pashkov on 21.12.2023.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel: ContentViewModel = ContentViewModel()
    
    @State var messageText: String = ""
    
    var body: some View {
        VStack {
            ScrollView {
                ForEach(viewModel.messages) { message in
                    MessageView(message: message)
                        .padding(4)
                }
            }
            Divider()
            HStack {
                TextField("Message...", text: $messageText, axis: .vertical)
                    .padding(8)
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(12)
                Button {
                    viewModel.sendMessage(content: messageText)
                    messageText = ""
                } label: {
                    Image(systemName: "paperplane")
                }
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
