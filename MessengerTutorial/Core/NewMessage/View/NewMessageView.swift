//
//  NewMessageView.swift
//  MessengerTutorial
//
//  Created by Jun Gu on 3/29/24.
//

import SwiftUI

struct NewMessageView: View {

    @State private var searchText = ""

    @StateObject private var viewModel = NewMessageViewModel()

    @Binding var selectUser: User?

    @Environment(\.dismiss) var dismiss

    var body: some View {
        NavigationStack {
            ScrollView {
                TextField("To: ", text: $searchText)
                    .frame(height: 44)
                    .padding(.leading)
                    .background(Color(.systemGroupedBackground))

                Text("CONTACTS")
                    .foregroundStyle(.gray)
                    .font(.footnote)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()

                ForEach(viewModel.users) { user in
                    VStack {
                        HStack {
                            CircularProfileImageView(user: user, size: .small)

                            Text(user.fullname)
                                .font(.subheadline)
                                .fontWeight(.semibold)

                            Spacer()
                        }
                        .padding(.leading)

                        Divider()
                            .padding(.leading, 40)
                    }
                    .onTapGesture {
                        selectUser = user
                        dismiss()
                    }
                }
            }
            .navigationTitle("New Message")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                    .foregroundStyle(.black)
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        NewMessageView(selectUser: .constant(User.MOCK_USER))
    }
}
