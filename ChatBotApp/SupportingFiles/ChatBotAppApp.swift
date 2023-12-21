//
//  ChatBotAppApp.swift
//  ChatBotApp
//
//  Created by Yuriy Pashkov on 21.12.2023.
//

import SwiftUI

@main
struct ChatBotAppApp: App {
    
    @UIApplicationDelegateAdaptor private var appDelegate: AppDelegate
    var apiKey: String = ""
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
