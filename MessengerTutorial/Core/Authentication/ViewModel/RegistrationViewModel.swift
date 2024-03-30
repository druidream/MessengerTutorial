//
//  RegistrationViewModel.swift
//  MessengerTutorial
//
//  Created by Jun Gu on 3/30/24.
//

import SwiftUI

class RegistrationViewModel: ObservableObject {

    @Published var email = ""
    @Published var password = ""
    @Published var fullname = ""

    func createUser() async throws {
        try await AuthService.shared.createUser(withEmail: email, password: password, fullname: fullname)
    }
}
