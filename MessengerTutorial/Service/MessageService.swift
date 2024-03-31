//
//  MessageService.swift
//  MessengerTutorial
//
//  Created by Jun Gu on 3/31/24.
//

import Foundation
import Firebase

struct MessageService {

    static let messagesCollection = Firestore.firestore().collection("messages")

    static func sendMessage(_ messageText: String, toUser user: User) {
        guard let currentUid = Auth.auth().currentUser?.uid else { return }
        let chatPartnerId = user.id
        let currentUserRef = Firestore.firestore().collection("messages").document(currentUid).collection(chatPartnerId).document()
        let chatPartnerRef = messagesCollection.document(chatPartnerId).collection(currentUid)

        let messageId = currentUserRef.documentID

        let message = Message(
            messageId: messageId,
            fromId: currentUid,
            toId: chatPartnerId,
            messageText: messageText,
            timestamp: Timestamp()
        )

        guard let messageData = try? Firestore.Encoder().encode(message) else { return }

        currentUserRef.setData(messageData)
        chatPartnerRef.document(messageId).setData(messageData)
    }
}
