//
//  MainView.swift
//  ChatBotApp
//
//  Created by Yuriy Pashkov on 22.12.2023.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            CreateChatView()
                .tabItem {
                    Label("Main", systemImage: "square.and.pencil")
                }
            
            FavoritesListView()
                .tabItem {
                    Label("Favorites", systemImage: "heart")
                }
        }
    }
}

#Preview {
    MainView()
}
