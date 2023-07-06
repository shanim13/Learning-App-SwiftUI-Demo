//
//  OtherLoginButtonView.swift
//  Education
//
//  Created by Shanim on 24/03/23.
//

import SwiftUI

struct OtherLoginButtonView: View {

    @Environment(\.openURL) var openURL

    var body: some View {

        HStack(spacing: 20) {
                Button(action: {
                    openURL(URL(string: "https://www.facebook.com/login/")!)
                }) {
                    HStack(spacing: 8) {
                        Image("facebook")
                            .frame(height: 18.0)
                        //                        .imageScale(.large)
                        Text("Facebook")
                            .font(.headline)
                            .fontWeight(.semibold)
                    }
                    .padding(.horizontal, 2)
                    .padding(.vertical,10)
                }.accentColor(.blue)
                    .buttonStyle(.borderedProminent)


            Button(action: {
                openURL(URL(string: "https://mail.google.com/")!)
            }) {
                HStack(spacing: 8) {
                    Image("google")
                        .frame(height: 18.0)
                        .scaledToFit()
                    Text("Google")
                        .font(.headline)
                        .fontWeight(.semibold)
                }
                .padding(.horizontal, 16)
                .padding(.vertical,10)
            }.accentColor(.red)
                .buttonStyle(.borderedProminent)
        }
    }
}

struct OtherLoginButtonView_Previews: PreviewProvider {
    static var previews: some View {
        OtherLoginButtonView()
    }
}
