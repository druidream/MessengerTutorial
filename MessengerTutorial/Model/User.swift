//
//  User.swift
//  MessengerTutorial
//
//  Created by Jun Gu on 3/30/24.
//

import Foundation
import FirebaseFirestoreSwift

struct User: Codable, Identifiable, Hashable {
    @DocumentID var uid: String?
    let fullname: String
    let email: String
    var profileImageUrl: String?

    var id: String {
        return uid ?? NSUUID().uuidString
    }

    var firstName: String {
        let formatter = PersonNameComponentsFormatter()
        let components = formatter.personNameComponents(from: fullname)
        return components?.givenName ?? fullname
    }
}

extension User {
    static let MOCK_USER = User(fullname: "Bruce Wayne", email: "batman@gmail.com", profileImageUrl: "batman")
}
