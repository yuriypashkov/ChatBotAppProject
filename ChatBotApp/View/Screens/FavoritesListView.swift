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
    
    private func groupByDate(items: [Dialog]) -> [(Date, [Dialog])] {
        let dict = Dictionary(grouping: items) { dialog -> Date in
            let dateComponents = Calendar.current.dateComponents([.day, .month, .year], from: dialog.createAt)
            let date = Calendar.current.date(from: dateComponents)
            return date ?? Date()
        }
        
        return dict.sorted(by: {$0.key < $1.key })
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                if dialogs.isEmpty {
                    Text("Favorites list is empty")
                } else {
                    // list of dialogs
                    List(groupByDate(items: dialogs), id:\.0) { pair in
                        Section {
                            ForEach(pair.1) { dialog in
                                NavigationLink {
                                    DialogView(dialog: dialog)
                                } label: {
                                    DialogCellView(dialog: dialog)
                                }
                            }
                        } header: {
                            Text(pair.0.formatted(.dateTime.day().month().year()))
                                .font(.system(size: 17, weight: .semibold))
                        }
                    }
                    .listStyle(.insetGrouped)
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
