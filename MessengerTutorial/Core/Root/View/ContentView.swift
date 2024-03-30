//
//  ContentView.swift
//  MessengerTutorial
//
//  Created by Jun Gu on 3/29/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ContentViewModel()

    var body: some View {
        Group {
            if viewModel.userSession != nil {
                InboxView()
            } else {
                LoginView()
            }
        }
    }
}

#Preview {
    ContentView()
}
