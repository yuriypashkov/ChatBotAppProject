//
//  Message.swift
//  ChatBotApp
//
//  Created by Yuriy Pashkov on 21.12.2023.
//

import Foundation

struct Message: Identifiable {
    var id: UUID = .init()
    var content: String
    var isUser: Bool
}
