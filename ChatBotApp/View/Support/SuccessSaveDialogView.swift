//
//  SuccessSaveDialogView.swift
//  ChatBotApp
//
//  Created by Yuriy Pashkov on 27.12.2023.
//

import SwiftUI

struct SuccessSaveDialogView: View {
    var body: some View {
        VStack {
            Text("Success saving dialog to Favorites")
                .padding()
                .background(Color.green)
                .foregroundColor(.white)
                .font(.system(size: 14, weight: .semibold))
                .clipShape(RoundedRectangle(cornerRadius: 12))
            Spacer()
        }
    }
}

#Preview {
    SuccessSaveDialogView()
}
