//
//  DialogCellView.swift
//  ChatBotApp
//
//  Created by Yuriy Pashkov on 22.12.2023.
//

import SwiftUI

struct DialogCellView: View {
    
    var dialog: Dialog
    
    var body: some View {
        VStack {
            Text(dialog.title)
        }
    }
}

