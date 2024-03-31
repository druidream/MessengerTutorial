//
//  ChatViewModel.swift
//  MessengerTutorial
//
//  Created by Jun Gu on 3/31/24.
//

import Foundation

class ChatViewModel: ObservableObject {
    @Published var messageText = ""
    let user: User

    init(user: User) {
        self.user = user
    }

    func sendMessage() {
        MessageService.sendMessage(messageText, toUser: user)
    }
}
