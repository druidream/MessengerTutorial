//
//  ChatMessageCell.swift
//  MessengerTutorial
//
//  Created by Jun Gu on 3/30/24.
//

import SwiftUI

struct ChatMessageCell: View {
    let isFromCurrentUser: Bool

    var body: some View {
        HStack {
            if isFromCurrentUser {
                Spacer()

                Text("This is a test message for now this is a longer message, let's see what happens")
                    .font(.subheadline)
                    .padding(12)
                    .background(Color(.systemBlue))
                    .foregroundStyle(.white)
                    .clipShape(ChatBubble(isFromCurrentUser: isFromCurrentUser))
                    .frame(maxWidth: UIScreen.main.bounds.width / 1.5, alignment: .trailing)
            } else {
                HStack(alignment: .bottom, spacing: 8) {
                    CircularProfileImageView(user: User.MOCK_USER, size: .xxSmall)
                    Text("This is a test message for now this is a longer message, let's see what happens")
                        .font(.subheadline)
                        .padding()
                        .background(Color(.systemGray5))
                        .foregroundStyle(.black)
                        .clipShape(ChatBubble(isFromCurrentUser: isFromCurrentUser))
                        .frame(maxWidth: UIScreen.main.bounds.width / 1.75, alignment: .leading)

                    Spacer()
                }
            }
        }
        .padding(.horizontal, 8)
    }
}

#Preview {
    ChatMessageCell(isFromCurrentUser: false)
}
