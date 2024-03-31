//
//  Constants.swift
//  MessengerTutorial
//
//  Created by Jun Gu on 3/31/24.
//

import Foundation
import Firebase

struct FirestoreConstants {
    static let UserCollection = Firestore.firestore().collection("users")
    static let MessagesCollection = Firestore.firestore().collection("messages")
}
