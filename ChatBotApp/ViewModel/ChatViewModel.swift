//
//  ContentViewModel.swift
//  ChatBotApp
//
//  Created by Yuriy Pashkov on 21.12.2023.
//

import Foundation
import OpenAI

class ChatViewModel: ObservableObject {
    
    @Published var messages: [Message] = []
    
    let openAI = OpenAI(apiToken: Constants.apiKey)
    
    deinit {
        print("viewModel deinit")
    }
    
    func sendMessage(content: String) {
        let newUserMessage = Message(date: Date(), content: content, isUser: true)
        messages.append(newUserMessage)
        getBotReplay()
    }
    
    private func getBotReplay() {
        
        //let personality = [Chat(role: .user, content: "You must respond to everything sadly")] // some test, or sarcasticly
        
        let botMessages = messages.map { Chat(role: .user, content: $0.content) }
        
        openAI.chats(query: .init(model: .gpt3_5Turbo,
                                  messages: botMessages)) { result in
            switch result {
            case .success(let success):
                guard let choice = success.choices.first else {
                    print("Error with choice-response")
                    return
                }
                guard let content = choice.message.content else {
                    print("Error with message content")
                    return
                }
                let message = Message(date: Date(), content: content, isUser: false)
                //print("Message content is \(content)")
                DispatchQueue.main.async {
                    self.messages.append(message)
                }
            case .failure(let failure):
                print(failure)
            }
        }
        
    }
}
