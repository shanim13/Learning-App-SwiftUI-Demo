//
//  ForgotPasswordView.swift
//  Education
//
//  Created by Shanim on 27/03/23.
//

import SwiftUI

struct ForgotPasswordView: View {

    @State var email: String = ""
    @State var mobile: String = ""
    @Binding var presentedAsModel: Bool
    @Binding var isLoggedIn: Bool

    var body: some View {

        NavigationView {
            GeometryReader { geometry in
                VStack {
                    Text("Forgot Password")
                        .foregroundColor(.indigo)
                        .font(.title)
                        .fontWeight(.semibold)
                        .padding(.top, 20)
                        .padding(.leading, 20)

                    ZStack {
                        Color.purple.opacity(0.1).edgesIgnoringSafeArea(.bottom)

                        VStack {

                            TextField("Enter Your Email Here", text: $email)
                                .padding(.horizontal, 20)
                                .padding(.vertical, 15)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                .background(Capsule().strokeBorder(Color.indigo, lineWidth: 1))
                                .padding(.horizontal, 20)
                                .padding(.top, 20)

                            Text("OR")
                                .font(.title2)
                                .fontWeight(.semibold)
                                .foregroundColor(.indigo)

                            TextField("Enter Your Password Here", text: $mobile)
                                .padding(.horizontal, 20)
                                .padding(.vertical, 15)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                .background(Capsule().strokeBorder(Color.indigo, lineWidth: 1))
                                .padding(.horizontal, 20)

                            //                            NavigationLink(destination: MainTabView().navigationBarBackButtonHidden(true)) {
                            //                                Text("Verify")
                            //                                    .font(.headline)
                            //                                    .tint(.indigo)
                            //                            }
                            
                            Button("Verify"){
                                isLoggedIn = true
                                presentedAsModel = false
                            }
                            .font(.headline)
                            .tint(.indigo)
                            .buttonStyle(.borderedProminent)
                            .clipShape(Capsule())
                            .padding(.top, 20)
                            .padding(.leading, 20)


                            Button("Back to LogIn") {
                                self.presentedAsModel = false
                            }
                            .font(.headline)
                            .tint(.indigo)
                            .buttonStyle(.borderedProminent)
                            .clipShape(Capsule())
                            .padding(.leading, 15)
                            .padding(.top, 20)
                            .padding(.bottom, 400)
                        }
                    }
                    .cornerRadius(40)
                    .padding(.bottom, -40)
                }
            }
        }
    }
}

struct ForgotPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ForgotPasswordView(presentedAsModel: .constant(true), isLoggedIn: .constant(true))
    }
}
