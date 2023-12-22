//
//  FavoritesListView.swift
//  ChatBotApp
//
//  Created by Yuriy Pashkov on 22.12.2023.
//

import SwiftUI
import SwiftData

struct FavoritesListView: View {

    @Query private var dialogs: [Dialog] // @Query(sort: \.created) 
    
    var body: some View {
        NavigationStack {
            VStack {
                if dialogs.isEmpty {
                    Text("Favorites list is empty")
                } else {
                    // list of dialogs
                    List(dialogs) { dialog in
                        NavigationLink {
                            DialogView(dialog: dialog)
                        } label: {
                            DialogCellView(dialog: dialog)
                        }
                        
                    }
                }
            }
            .navigationTitle("Favorites")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    FavoritesListView()
        .modelContainer(previewContainer)
}
