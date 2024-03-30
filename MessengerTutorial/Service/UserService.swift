//
//  UserService.swift
//  MessengerTutorial
//
//  Created by Jun Gu on 3/30/24.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

class UserService {

    @Published var currentUser: User?

    static let shared = UserService()

    func fetchCurrentUser() async throws {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        let snapshot = try await Firestore.firestore().collection("users").document(uid).getDocument()
        let user = try snapshot.data(as: User.self)
        print("DEBUG: Current user in service is \(currentUser)")
    }
}
