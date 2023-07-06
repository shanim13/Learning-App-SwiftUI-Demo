//
//  PurchaseView.swift
//  Education
//
//  Created by Shanim on 15/04/23.
//

import SwiftUI

struct PurchaseView: View {

    @State private var cardNumber = ""
    @State private var expirationMonth = ""
    @State private var expirationYear = ""
    @State private var cvv = ""

    var body: some View {

        VStack {
            Image("students")
            Text("One click away from a\nbrilliant future.")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.indigo)
                .multilineTextAlignment(.center)

            ZStack {
                Color.purple.opacity(0.1)
                VStack {

                    ZStack {
                        Color.indigo
                            .frame(width: 250, height: 80)



                        Text("BUY OUR COURSES")
                            .padding(.top, 20)
                            .font(.title2)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .tint(.indigo)
                            .padding(.bottom, 20)

                    }
                    .cornerRadius(40)
                    .padding(.top, 20)
                    .padding(.bottom, 20)

                    Text("Card Number")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .foregroundColor(.indigo)

                    TextField("XXXX XXXX XXXX XXXX", text: $cardNumber)
                        .font(.title3)
                        .foregroundColor(.indigo)
                        .multilineTextAlignment(.center)
                        .frame(width: 350)
                        .background(Color(.systemGray6))
                        .cornerRadius(10)

                    HStack(spacing: 10) {
                        VStack(alignment: .leading, spacing: 5) {
                            Text("Expiration")
                                .font(.title2)
                                .fontWeight(.semibold)
                                .foregroundColor(.indigo)
                                .padding()

                            HStack {
                                TextField("MM", text: $expirationMonth)
                                    .font(.title2)
                                    .fontWeight(.semibold)
                                    .foregroundColor(.indigo)
                                    .padding()
                                    .background(Color(.systemGray6))
                                    .cornerRadius(10)
                                    .frame(width: 50)

                                Text("/")
                                    .font(.headline)
                                    .foregroundColor(.indigo)

                                TextField("YY", text: $expirationYear)
                                    .font(.title2)
                                    .fontWeight(.semibold)
                                    .foregroundColor(.indigo)
                                    .padding()
                                    .background(Color(.systemGray6))
                                    .cornerRadius(10)
                                    .frame(width: 50)
                            }
                        }

                        VStack(alignment: .leading, spacing: 5) {
                            Text("CVV")
                                .font(.title2)
                                .fontWeight(.semibold)
                                .foregroundColor(.indigo)
                                .padding()

                            TextField("XXX", text: $cvv)
                                .font(.title2)
                                .fontWeight(.semibold)
                                .foregroundColor(.indigo)
                                .padding()
                                .background(Color(.systemGray6))
                                .cornerRadius(10)
                                .frame(width: 100)
                        }
                    }

                    Spacer()

                    Button(action: {
                        // Add your purchase code here
                        print("Purchase button tapped!")
                    }) {
                        Text("Purchase")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.green)
                            .cornerRadius(10)
                    }
                }
            }
            .cornerRadius(40)
            .padding(.bottom, -40)
        }
    }
}

struct PurchaseView_Previews: PreviewProvider {
    static var previews: some View {
        PurchaseView()
    }
}

//struct VisaPurchaseView: View {
//    @State private var cardNumber = ""
//    @State private var expirationMonth = ""
//    @State private var expirationYear = ""
//    @State private var cvv = ""
//
//    var body: some View {
//        VStack(alignment: .leading, spacing: 20) {
//            Text("Card Number")
//                .font(.caption)
//                .foregroundColor(.gray)
//            TextField("XXXX XXXX XXXX XXXX", text: $cardNumber)
//                .font(.headline)
//                .padding()
//                .background(Color(.systemGray6))
//                .cornerRadius(10)
//
//            HStack(spacing: 10) {
//                VStack(alignment: .leading, spacing: 5) {
//                    Text("Expiration")
//                        .font(.caption)
//                        .foregroundColor(.gray)
//                    HStack {
//                        TextField("MM", text: $expirationMonth)
//                            .font(.headline)
//                            .padding()
//                            .background(Color(.systemGray6))
//                            .cornerRadius(10)
//                            .frame(width: 50)
//
//                        Text("/")
//                            .font(.headline)
//
//                        TextField("YY", text: $expirationYear)
//                            .font(.headline)
//                            .padding()
//                            .background(Color(.systemGray6))
//                            .cornerRadius(10)
//                            .frame(width: 50)
//                    }
//                }
//
//                VStack(alignment: .leading, spacing: 5) {
//                    Text("CVV")
//                        .font(.caption)
//                        .foregroundColor(.gray)
//                    TextField("XXX", text: $cvv)
//                        .font(.headline)
//                        .padding()
//                        .background(Color(.systemGray6))
//                        .cornerRadius(10)
//                        .frame(width: 100)
//                }
//            }
//
//            Spacer()
//
//            Button(action: {
//                // Add your purchase code here
//                print("Purchase button tapped!")
//            }) {
//                Text("Purchase")
//                    .font(.headline)
//                    .foregroundColor(.white)
//                    .padding()
//                    .frame(maxWidth: .infinity)
//                    .background(Color.green)
//                    .cornerRadius(10)
//            }
//        }
//        .padding()
//        .navigationBarTitle("Visa Purchase", displayMode: .inline)
//    }
//}
