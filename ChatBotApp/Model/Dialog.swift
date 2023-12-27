//
//  Dialog.swift
//  ChatBotApp
//
//  Created by Yuriy Pashkov on 21.12.2023.
//

import Foundation
import SwiftData

@Model
class Dialog {
    
    var title: String
    var messages: [Message]
    var createAt: Date
    
    init(title: String, messages: [Message]) {
        self.title = title
        self.messages = messages
        self.createAt = Date()
    }
}
