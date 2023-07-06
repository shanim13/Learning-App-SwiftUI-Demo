//
//  AccountView.swift
//  Education
//
//  Created by Shanim on 27/03/23.
//

import SwiftUI
import PhotosUI

struct AccountView: View {

    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var userData: UserData
    
    @State private var showingAlert = false
    @State private var selectedItem: PhotosPickerItem? = nil
    @State private var selectedImageData: Data? = nil

    var body: some View {

        NavigationView {
            //            ScrollView(.vertical, showsIndicators: false) {

            VStack(spacing: 20) {

                Spacer()
                GroupBox(content: {
                    HStack {
                        VStack {

//                            if let selectedImageData,
//                               let uiImage = UIImage(data: selectedImageData) {
//                                Image(uiImage: uiImage)
//                                    .resizable()
//                                    .frame(width: 100, height: 100)
//                                    .foregroundColor(.indigo)
//                                    .clipShape(Circle())
//                            }

                            if let imageData = userData.selectedImage,
                               let uiImage = UIImage(data: imageData) {
                                Image(uiImage: uiImage)
                                    .resizable()
                                    .frame(width: 100, height: 100)
                                    .foregroundColor(.indigo)
                                    .clipShape(Circle())
                            } else {
                                Image(systemName: "person.circle.fill")
                                    .resizable()
                                    .frame(width: 100, height: 100)
                                    .foregroundColor(.indigo)
                                    .clipShape(Circle())
                            }
                        }
                        VStack {
                            Text("John Doe")
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(.indigo)
                            Text("JohnDoe@gmail.com")
                                .font(.title3)
                                .fontWeight(.semibold)
                                .foregroundColor(.indigo)
                        }
                    }
                })

                ZStack {
                    Color.purple.opacity(0.1)
                    ScrollView(.vertical, showsIndicators: false) {
                        VStack {

                            AccountSettingsLabelView(labelText: "Account Setting", labelImage: "arrow.right", labelColor: .indigo)
                            AccountSettingsLabelView(labelText: "Download Options", labelImage: "arrow.right", labelColor: .indigo)
                            AccountSettingsLabelView(labelText: "Notifications Setting", labelImage: "arrow.right", labelColor: .indigo)
                                .padding(.bottom, 20)
                            AccountSettingsLabelView(labelText: "Privacy & Policy", labelImage: "arrow.right", labelColor: .indigo)
                            AccountSettingsLabelView(labelText: "Help Center", labelImage: "arrow.right", labelColor: .indigo)
                            AccountSettingsLabelView(labelText: "About US", labelImage: "arrow.right", labelColor: .indigo)
                            AccountSettingsLabelView(labelText: "Delete Account", labelImage: "arrow.right", labelColor: .red)
                                .padding(.bottom, 40)

                            Button(action: {
                                showingAlert = true
                            }, label: {
                                Text("LOG OUT")
                                    .font(.title2)
                                    .fontWeight(.semibold)
                            })  .buttonStyle(.borderedProminent)
                                .tint(.indigo)
                                .clipShape(Capsule())
                                .alert("Are You Sure\n You want to logout?", isPresented: $showingAlert) {

                                    Button("NO", role: .cancel) { }

                                    Button("YES", role: .destructive) {
                                        presentationMode.wrappedValue.dismiss()
                                    }
                                }
                            Spacer()
                        }
                        .padding(.all,30)
                    }
                    .cornerRadius(40)
                }
            }
            .navigationBarTitle("Account Setting", displayMode: .inline)
        }
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
            .environmentObject(UserData())
    }
}
