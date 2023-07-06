//
//  EmotyTutorsView.swift
//  Education
//
//  Created by Shanim on 15/04/23.
//

import SwiftUI

struct EmptyTutorsView: View {
    var body: some View {
        VStack {
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle())
            Text("Refresh Data")
        }
        .padding()
        .background(Color.purple.opacity(0.2))
        .cornerRadius(10)
    }
}

struct EmptyTutorsView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyTutorsView()
    }
}
