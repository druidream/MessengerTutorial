//
//  InboxRowView.swift
//  MessengerTutorial
//
//  Created by Jun Gu on 3/29/24.
//

import SwiftUI

struct InboxRowView: View {
    let message: Message

    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            CircularProfileImageView(user: message.user, size: .medium)

            VStack(alignment: .leading, spacing: 4) {
                Text(message.user?.fullname ?? "")
                    .font(.subheadline)
                    .fontWeight(.semibold)

                Text(message.messageText)
                    .font(.subheadline)
                    .foregroundStyle(.gray)
                    .lineLimit(2)
                    .frame(maxWidth: UIScreen.main.bounds.width - 100, alignment: .leading)
            }

            HStack {
                Text(message.timestampString)

                Image(systemName: "chevron.right")
            }
            .font(.footnote)
            .foregroundColor(.gray)
        }
        .frame(height: 72)
    }
}

//#Preview {
//    InboxRowView()
//}
