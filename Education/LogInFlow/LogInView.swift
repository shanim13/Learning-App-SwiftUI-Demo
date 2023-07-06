//
//  LogInView.swift
//  Education
//
//  Created by Shanim on 24/03/23.
//

import SwiftUI

struct LogInView: View {

    @StateObject var viewModel = LoginViewModel()

    @State var presentingModal = false
    @State var isLoggedIn: Bool = false
    @State var isRemeberChecked: Bool = false
    @State var isSecure: Bool = true

    var body: some View {

        GeometryReader { geometry in
            VStack(spacing: 20) {

                Text("LOG IN")
                    .foregroundColor(.indigo)
                    .font(.title2)
                    .fontWeight(.semibold)
                    .padding(.top, 0)

                Text("Learning App")
                    .font(.largeTitle)
                    .foregroundColor(.indigo)
                    .fontWeight(.heavy)
                    .padding(.top, 20)

                Text("Enter Your LogIn details to access\n your account")
                    .foregroundColor(.indigo)
                    .font(.title2)
                    .fontWeight(.regular)
                    .multilineTextAlignment(.center)
                    .lineLimit(2)
                    .frame(height: 60)
                    .padding(.horizontal, 8)
                    .padding(.top, 20)

                ZStack {
                    Color.purple.opacity(0.1)


                    VStack(alignment: .center, spacing: 20) {

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

                        ZStack(alignment: .trailing){

                            Group{
                                if isSecure{
                                    SecureField("Enter Your Password Here", text: $viewModel.password, onCommit: {
                                        DispatchQueue.main.async {
                                            self.viewModel.validateFields()
                                        }
                                    })

                                }else {
                                    TextField("Enter Your Password Here", text: $viewModel.password, onCommit: {
                                        DispatchQueue.main.async {
                                            self.viewModel.validateFields()
                                        }
                                    })
                                }
                            }
                            .animation(.easeInOut(duration: 0.2), value: isSecure)
                            .padding(.horizontal, 20)
                            .padding(.vertical, 15)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .background(Capsule().strokeBorder(Color.indigo, lineWidth: 1))
                            .padding(.horizontal, 20)

                            Button(action: {
                                isSecure.toggle()
                            }, label: {
                                Image(systemName: !isSecure ? "eye" : "eye.slash")
                                    .foregroundColor(.indigo)
                            }) .padding(.trailing, 30)

                        }

                        if !self.viewModel.errorMessage.isEmpty {
                            Text(self.viewModel.errorMessage)
                                .foregroundColor(.red)
                        }

                        HStack {

                            Group {
                                Button(action: {
                                    isRemeberChecked.toggle()
                                }) {
                                    Image(systemName: self.isRemeberChecked ? "checkmark.square" : "square")
                                        .resizable()
                                        .frame(width: 25, height: 25)
                                        .tint(.indigo)

                                }.padding(.horizontal, 10)

                                Text("Remember Me?")
                                    .foregroundColor(.indigo)

                                //                                NavigationLink(destination: ForgotPasswordView()) {
                                //                                    Text("Forgot Password?")
                                //                                }.foregroundColor(.red)
                                //                                    .padding(.horizontal, 20)

                                Button("Forgot Password?") {
                                    self.presentingModal = true
                                }
                                .foregroundColor(.red)
                                .padding(.horizontal, 20)
                                .sheet(isPresented: $presentingModal) {
                                    
                                    ForgotPasswordView(presentedAsModel: $presentingModal, isLoggedIn: $isLoggedIn)
                                }

                                NavigationLink(destination: MainTabView(), isActive: $isLoggedIn) {
                                    EmptyView()
                                }
                            }
                        }
                        .padding(.top, 20)

                        NavigationLink(destination: MainTabView()) {
                            Text("Log In To Your Account")
                                .font(.headline)
                                .clipShape(Capsule())
                        }
                        .buttonStyle(.borderedProminent)
                        .tint(.indigo)
                        .disabled(!self.viewModel.isValid)
                        .padding(.top, 5)

                        OtherLoginButtonView()
                            .padding(.top, 10)

                        HStack {
                            Text("Don't have an account ?")
                                .foregroundColor(.indigo)

                            NavigationLink(destination: SignUpView()){
                                Text("Create Account")
                                    .fontWeight(.bold)
                            }
                        }
                        .padding(.top, 20)
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

struct LogInView_Previews: PreviewProvider {
    static var previews: some View {
        LogInView()
    }
}
