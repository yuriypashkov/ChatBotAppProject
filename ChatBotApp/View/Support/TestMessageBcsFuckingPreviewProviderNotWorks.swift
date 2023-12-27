//
//  TestMessageBcsFuckingPreviewProviderNotWorks.swift
//  ChatBotApp
//
//  Created by Yuriy Pashkov on 24.12.2023.
//

import SwiftUI

struct TestMessageBcsFuckingPreviewProviderNotWorks: View {
    var body: some View {
        HStack {
            Spacer()
            ZStack(alignment: .bottomTrailing) {
                Text("Test content")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                Text(Date().formatted(date: .abbreviated, time: .standard))
                    .font(.system(size: 8, weight: .semibold))
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 4, trailing: 12))
                    .foregroundColor(.white.opacity(0.6))
                    .italic()
            }
        }
    }
}

#Preview {
    TestMessageBcsFuckingPreviewProviderNotWorks()
}
