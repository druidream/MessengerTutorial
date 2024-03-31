//
//  Route.swift
//  MessengerTutorial
//
//  Created by Jun Gu on 3/31/24.
//

import Foundation

enum Route: Hashable {
    case profile(User)
    case chatView(User)
}
