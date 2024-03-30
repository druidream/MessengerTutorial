//
//  LoginViewModel.swift
//  MessengerTutorial
//
//  Created by Jun Gu on 3/30/24.
//

import SwiftUI

class LoginViewModel: ObservableObject {

    @Published var email = ""
    @Published var password = ""

    func login() async throws {
        try await AuthService.shared.login(withEmail: email, password: password)
    }
}
