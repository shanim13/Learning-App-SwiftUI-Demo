//
//  SignUpView.swift
//  Education
//
//  Created by Shanim on 27/03/23.
//

import SwiftUI

struct SignUpView: View {

    @StateObject var viewModel = SignUpViewModel()
    @State private var showingAlert = false

    var body: some View {

        GeometryReader { geometry in
            VStack {
                Text("SIGN UP")
                    .foregroundColor(.indigo)
                    .font(.title2)
                    .fontWeight(.semibold)
                    .padding(.top, 0)

                Text("Learning App")
                    .font(.largeTitle)
                    .foregroundColor(.indigo)
                    .fontWeight(.heavy)
                    .padding(.top, 10)

                Text("Enter your details to create\n your account")
                    .foregroundColor(.indigo)
                    .font(.title2)
                    .fontWeight(.regular)
                    .multilineTextAlignment(.center)
                    .frame(height: 55)
                    .padding(.top, 10)

                ZStack(alignment: .center) {

                    Color.purple.opacity(0.1)
                    VStack {
                        TextField("First Name", text: $viewModel.firstName)
                            .padding(.horizontal, 20)
                            .padding(.vertical, 15)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .background(Capsule().strokeBorder(Color.indigo, lineWidth: 1))
                            .padding(.horizontal, 20)
                            .padding(.top, 10)


                        TextField("Last Name", text: $viewModel.lastName)
                            .padding(.horizontal, 20)
                            .padding(.vertical, 15)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .background(Capsule().strokeBorder(Color.indigo, lineWidth: 1))
                            .padding(.horizontal, 20)
                            .padding(.top, 5)


                        TextField("Enter Your Email Here", text: $viewModel.email, onEditingChanged: { _ in
                            DispatchQueue.main.async {
                                self.viewModel.validateFields()
                            }
                        })
                        .padding(.horizontal, 20)
                        .padding(.vertical, 15)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .background(Capsule().strokeBorder(Color.indigo, lineWidth: 1))
                        .padding(.horizontal, 20)
                        .padding(.top, 5)

                        TextField("Enter Your Password Here", text: $viewModel.password, onCommit: {
                            DispatchQueue.main.async {
                                self.viewModel.validateFields()
                            }
                        })
                        .padding(.horizontal, 20)
                        .padding(.vertical, 15)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .background(Capsule().strokeBorder(Color.indigo, lineWidth: 1))
                        .padding(.horizontal, 20)
                        .padding(.top, 5)


                        ZStack(alignment: .trailing){

                            TextField("Confirm Password", text: $viewModel.confirmPassword, onCommit: {
                                DispatchQueue.main.async {
                                    self.viewModel.validateFields()
                                }
                            })
                            //                    .animation(.easeInOut(duration: 0.2), value: viewModel.)
                            .padding(.horizontal, 20)
                            .padding(.vertical, 15)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .background(Capsule().strokeBorder(Color.indigo, lineWidth: 1))
                            .padding(.horizontal, 20)
                            .padding(.top, 5)

                            //                    Image(systemName: !viewModel.isPasswordsMatched ? "checkmark" : "" )
                            //                        .foregroundColor(.green)
                            //                        .padding(.trailing, 30)
                        }

                        if !self.viewModel.errorMessage.isEmpty {
                            Text(self.viewModel.errorMessage)
                                .foregroundColor(.red)
                        }

                        NavigationLink(destination: SelectLevelView()) {
                            Text("Sign In To Your Account")
                                .font(.headline)
                        }
                        .buttonStyle(.borderedProminent)
                        .tint(.indigo)
                        .clipShape(Capsule())
                        .padding(.top, 30)
                        //                .padding(.bottom, 200)
                        .disabled(!self.viewModel.isValid)

                        Spacer()
                    }
                    .padding(.top, 20)
                }
                .cornerRadius(40)
                .padding(.bottom, -40)

            }
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
