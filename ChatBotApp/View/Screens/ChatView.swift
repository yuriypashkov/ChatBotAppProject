//
//  ContentView.swift
//  ChatBotApp
//
//  Created by Yuriy Pashkov on 21.12.2023.
//

import SwiftUI
import SwiftData

struct ChatView: View {
    // model context for work with SwiftData
    @Environment(\.modelContext) private var modelContext
    // view model with messages
    @StateObject var viewModel: ChatViewModel = ChatViewModel()
    // state var for textfield
    @State private var messageText: String = ""
    // state var for show/hide EnterDialogTitleView
    @State private var showingEnterNameView = false
    // state var for saving dialog title
    @State private var titleText: String = ""
    // state var for show/hide saving success view
    @State private var showingSaveDialogView = false
    
    var body: some View {
        ZStack {
            ScrollViewReader { proxy in
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
                            .id(message.date)
                    }
                }
                .onChange(of: viewModel.messages.count) { _, _ in
                    proxy.scrollTo(viewModel.messages.last?.date)
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
                        withAnimation {
                            showingEnterNameView.toggle()
                        }
                    } label: {
                        Image(systemName: "heart")
                            .resizable()
                            .frame(width: 26, height: 24, alignment: .center)
                    }
                    .disabled(viewModel.messages.isEmpty)
                }
            }
            if showingEnterNameView {
                EnterDialogNameView(text: $titleText) {
                    modelContext.insert(Dialog(title: titleText, messages: viewModel.messages))
                    withAnimation {
                        showingEnterNameView.toggle()
                        showingSaveDialogView.toggle()
                    }
                }
            }
            if showingSaveDialogView {
                SuccessSaveDialogView()
                    .onAppear() {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                            showingSaveDialogView.toggle()
                        }
                    }
            }
        }
    }
}

#Preview {
    ChatView()
}
