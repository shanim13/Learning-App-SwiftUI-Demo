//
//  profileView.swift
//  Education
//
//  Created by Shanim on 05/04/23.
//

import SwiftUI
import PhotosUI

struct ProfileView: View {

    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var userData: UserData

    @State private var showingAlert = false
    @State private var selectedItem: PhotosPickerItem? = nil
    @State private var selectedImageData: Data? = nil
    @State private var name: String = ""
    @State private var dob: String = ""
    @State private var gender: String = ""
    @State private var location: String = ""
    @State private var phone: String = ""
    @State private var bio: String = ""
    @State private var birthDate = Date.now
    @Binding var presentedAsModel: Bool

    var body: some View {

        VStack {

            if let selectedImageData,
               let uiImage = UIImage(data: selectedImageData) {
                Image(uiImage: uiImage )
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


            PhotosPicker(selection: $selectedItem,matching: .images, photoLibrary: .shared()) {
                Text("Upload Photo")
                    .foregroundColor(.indigo)
                    .font(.callout)
            }
            .buttonStyle(.bordered)
            .padding(.bottom, 20)
            .onChange(of: selectedItem) { newItem in
                Task {
                    if let data = try? await newItem?.loadTransferable(type: Data.self) {
                        selectedImageData = data
                        userData.selectedImage = selectedImageData
                    }
                }
            }
            ZStack {
                Color.purple.opacity(0.1)

                VStack {

                    TextField("Name", text: $name)
                        .padding(.horizontal, 20)
                        .padding(.vertical, 15)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .background(Capsule().strokeBorder(Color.indigo, lineWidth: 1))
                        .padding(.horizontal, 20)

                        .padding(.top, 30)
                    HStack {

                        ZStack(alignment: .trailing){

//                            TextField("D.O.B", text: $dob)
//                                .padding(.horizontal, 20)
//                                .padding(.vertical, 15)
//                                .clipShape(RoundedRectangle(cornerRadius: 10))
//                                .background(Capsule().strokeBorder(Color.indigo, lineWidth: 1))
//                                .padding(.leading, 20)
//                                .padding(.top, 10)

                            DatePicker("D.O.B", selection: $birthDate, displayedComponents: [.date])
                                .padding(.horizontal, 20)
                                .padding(.vertical, 10)
                                .foregroundColor(.indigo)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                .background(Capsule().strokeBorder(Color.indigo, lineWidth: 1))
                                .frame(width: 220)
                                .padding(.leading, 20)
                                .padding(.top, 10)


//                            Button(action: {
//
//                            }, label: {
//                                Image(systemName: "calendar")
//                                    .foregroundColor(.indigo)
//                                    .scaledToFit()
//                            })
//                            .padding(.trailing, 10)
                        }

                        TextField("Gender", text: $gender)
                            .padding(.horizontal, 20)
                            .padding(.vertical, 15)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .background(Capsule().strokeBorder(Color.indigo, lineWidth: 1))
                            .padding(.trailing, 20)
                            .padding(.top, 10)
                    }

                    TextField("Phone", text: $phone)
                        .padding(.horizontal, 20)
                        .padding(.vertical, 15)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .background(Capsule().strokeBorder(Color.indigo, lineWidth: 1))
                        .padding(.horizontal, 20)
                        .padding(.top, 10)

                    TextField("Location", text: $location)
                        .padding(.horizontal, 20)
                        .padding(.vertical, 15)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .background(Capsule().strokeBorder(Color.indigo, lineWidth: 1))
                        .padding(.horizontal, 20)
                        .padding(.top, 10)

                    TextField("Bio", text: $bio)
                        .padding(.horizontal, 20)
                        .padding(.vertical, 15)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .background(Capsule().strokeBorder(Color.indigo, lineWidth: 1))
                        .padding(.horizontal, 20)
                        .padding(.top, 10)
                    Spacer()

                    Button("Update") {
                        self.presentedAsModel = false
                    }
                    .font(.title)
                    .tint(.indigo)
                    .buttonStyle(.borderedProminent)
                    .clipShape(Capsule())
                    .padding(.leading, 15)
                    .padding(.top, 10)

                    HStack(spacing: 30) {
                        ZStack {
                            Color.indigo
                            VStack {
                                Text("Level -")
                                    .foregroundColor(.white)
                                    .fontWeight(.semibold)
                                    .font(.title3)
                                Text("Beginner")
                                    .foregroundColor(.white)
                                    .fontWeight(.semibold)
                                    .font(.title2)
                                    .shadow(radius: 10)
                            }
                        }
                        .frame(width: 150, height: 100)
                        .cornerRadius(40)
                        .padding(.bottom, 100)

                        ZStack {
                            Color.indigo
                            VStack {
                                Text("Buy Full Course")
                                    .foregroundColor(.white)
                                    .fontWeight(.semibold)
                                    .font(.headline)
                                Text("Try 1 month\n for free")
                                    .foregroundColor(.white)
                                    .fontWeight(.regular)
                                    .font(.headline)
                                    .shadow(radius: 10)
                            }
                        }
                        .frame(width: 155, height: 100)
                        .cornerRadius(40)
                        .padding(.bottom, 100)
                    }

                }
                .font(.headline)
                .fontWeight(.regular)
                .navigationBarTitle("Profile", displayMode: .inline)
            }
            .cornerRadius(40)
            .padding(.bottom, -40)
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(presentedAsModel:  .constant(true))
    }
}
