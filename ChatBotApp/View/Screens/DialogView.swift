//
//  DialogView.swift
//  ChatBotApp
//
//  Created by Yuriy Pashkov on 22.12.2023.
//

import SwiftUI

struct DialogView: View {
    
    var dialog: Dialog
    
    var body: some View {
        VStack {
            ScrollView {
                ForEach(dialog.messages.sorted {$0.date < $1.date}) { message in
                    MessageView(message: message)
                        .padding(4)
                }
            }
        }
        .toolbar(.hidden, for: .tabBar)
        .navigationTitle(dialog.title)
    }
}
