//
//  Message.swift
//  ChatBotApp
//
//  Created by Yuriy Pashkov on 21.12.2023.
//

import Foundation
import SwiftData

@Model
class Message: Equatable {
    
    var date: Date
    var content: String
    var isUser: Bool
    
    init(date: Date, content: String, isUser: Bool) {
        self.date = date
        self.content = content
        self.isUser = isUser
    }
    
    static func == (lhs: Message, rhs: Message) -> Bool {
        return lhs.date == rhs.date
    }
}
