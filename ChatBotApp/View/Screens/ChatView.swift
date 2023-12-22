//
//  ContentView.swift
//  ChatBotApp
//
//  Created by Yuriy Pashkov on 21.12.2023.
//

import SwiftUI
import SwiftData

struct ChatView: View {
    @Environment(\.modelContext) private var modelContext
    
    @StateObject var viewModel: ChatViewModel = ChatViewModel()
    
    @State var messageText: String = ""
    
    var body: some View {
        VStack {
            ScrollView {
                if viewModel.messages.isEmpty {
                    Text("Write something for starting dialog")
                        .padding()
                        .background(Color.green)
                        .foregroundColor(.white)
                        .font(.system(size: 14, weight: .semibold))
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                }
                
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
        .navigationTitle("Hi there")
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    modelContext.insert(Dialog(title: Date().formatted(date: .abbreviated, time: .standard), messages: viewModel.messages))
                } label: {
                    Image(systemName: "heart")
                        .resizable()
                        .frame(width: 26, height: 24, alignment: .center)
                }
                .disabled(viewModel.messages.isEmpty)
            }
        }
    }
}

#Preview {
    ChatView()
}
