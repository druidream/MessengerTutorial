//
//  RegistrationView.swift
//  MessengerTutorial
//
//  Created by Jun Gu on 3/29/24.
//

import SwiftUI

struct RegistrationView: View {

    @StateObject var viewModel = RegistrationViewModel()

    @Environment(\.dismiss) var dismiss

    var body: some View {
        VStack {
            Spacer()

            // logo image

            Image("messenger-app-icon")
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 150)
                .padding()

            // text fields

            VStack {
                TextField("Enter your email", text: $viewModel.email)
                    .font(.subheadline)
                    .padding(12)
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                    .padding(.horizontal, 24)

                TextField("Enter your fullname", text: $viewModel.fullname)
                    .font(.subheadline)
                    .padding(12)
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                    .padding(.horizontal, 24)

                SecureField("Enter your password", text: $viewModel.password)
                    .font(.subheadline)
                    .padding(12)
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                    .padding(.horizontal, 24)
            }

            Button {
                Task { try await viewModel.createUser() }
            } label: {
                Text("Sign Up")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
                    .frame(width: 360, height: 44)
                    .background(Color(.systemBlue))
                    .cornerRadius(10)
            }

            Spacer()

            Divider()

            Button {
                dismiss()
            } label: {
                HStack(spacing: 3) {
                    Text("Already have an account")

                    Text("Sign Ip")
                        .fontWeight(.semibold)
                }
                .font(.footnote)
            }
            .padding(.vertical)
        }
    }
}

#Preview {
    RegistrationView()
}
