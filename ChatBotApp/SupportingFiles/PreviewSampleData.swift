//
//  PreviewSampleData.swift
//  ChatBotApp
//
//  Created by Yuriy Pashkov on 22.12.2023.
//

import Foundation
import SwiftUI
import SwiftData

@MainActor
let previewContainer: ModelContainer = {
    do {
        let container = try ModelContainer(for: Dialog.self, configurations: ModelConfiguration(isStoredInMemoryOnly: true))
        for dialog in SampleDialogs.contents {
            container.mainContext.insert(dialog)
        }
        return container
    } catch {
        fatalError("Fatal error with preview container")
    }
}()
