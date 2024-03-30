//
//  ProfileView.swift
//  MessengerTutorial
//
//  Created by Jun Gu on 3/29/24.
//

import SwiftUI
import PhotosUI

struct ProfileView: View {

    @StateObject var viewModel = ProfileViewModel()

    var body: some View {
        VStack {
            // header

            VStack {
                PhotosPicker(selection: $viewModel.selectedItem) {
                    if let profileImage = viewModel.profileImage {
                        profileImage
                            .resizable()
                            .scaledToFill()
                            .frame(width: 80, height: 80)
                            .foregroundColor(Color(.systemGray4))
                    } else {
                        Image(systemName: "person.circle.fill")
                            .resizable()
                            .frame(width: 80, height: 80)
                            .foregroundColor(Color(.systemGray4))
                    }
                }

                Text("Bruce Wayne")
                    .font(.title2)
                    .fontWeight(.semibold)
            }

            // list

            List {
                Section {
                    ForEach(SettingsOptionsViewModel.allCases, id: \.self) { option in
                        HStack {
                            Image(systemName: option.imageName)
                                .resizable()
                                .frame(width: 24, height: 24)
                                .foregroundStyle(Color(.systemPurple))

                            Text(option.title)
                                .font(.subheadline)
                        }
                    }
                }

                Section {
                    Button("Log Out") {

                    }

                    Button("Delete Account") {

                    }
                }
                .foregroundStyle(.red)
            }
        }
    }
}

#Preview {
    ProfileView()
}
