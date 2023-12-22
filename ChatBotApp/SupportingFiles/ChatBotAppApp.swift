//
//  ChatBotAppApp.swift
//  ChatBotApp
//
//  Created by Yuriy Pashkov on 21.12.2023.
//

import SwiftUI
import SwiftData

@main
struct ChatBotAppApp: App {
    
    @UIApplicationDelegateAdaptor private var appDelegate: AppDelegate
    
    var body: some Scene {
        WindowGroup {
            MainView()
        }
        .modelContainer(for: Dialog.self) 
    }
}
