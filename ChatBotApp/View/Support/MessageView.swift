//
//  MessageView.swift
//  ChatBotApp
//
//  Created by Yuriy Pashkov on 21.12.2023.
//

import SwiftUI

struct MessageView: View {
    
    var message: Message
    
    var body: some View {
            HStack {
                if message.isUser { Spacer() }
                ZStack(alignment: .bottomTrailing) {
                    Text(message.content)
                        .padding()
                        .background(message.isUser ? .blue : .black)
                        .foregroundColor(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 16))
                    Text(message.date.formatted(.dateTime.hour().minute()))
                        .font(.system(size: 7, weight: .semibold))
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 4, trailing: 12))
                        .foregroundColor(.white.opacity(0.6))
                        .italic()
                }
                if !message.isUser { Spacer() }
            }
        }
}

//#Preview {
//    let message = Message(date: Date(), content: "Test content", isUser: true)
//    return MessageView(message: message)
//}

//struct MessageView_Previews: PreviewProvider {
//    static var previews: some View {
//        let message = Message(date: Date(), content: "This is a test content", isUser: true)
//        MessageView(message: message)
//    }
//}
