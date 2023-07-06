//
//  InitialView.swift
//  Education
//
//  Created by Shanim on 24/03/23.
//

import SwiftUI

struct InitialView: View {

    var body: some View {

        VStack(spacing: 20) {

            Spacer()
            Image("initialEd")
                .resizable()
                .frame(width: 300, height: 200)

            Text("Online Learning Platform")
                .font(.title)
                .foregroundColor(.indigo)
                .fontWeight(.heavy)
            Spacer()
            
            ZStack {
                Color.purple.opacity(0.1)
                VStack(spacing: 20){
                    Text("Knowledge sharing is particularly useful amongst modern learners as they experience a more intricate relationship with course material and with their colleagues.")
                        .font(.headline)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal,15)
                        .foregroundColor(.purple)
                        .fontWeight(.medium)

                    NavigationLink(destination: LogInView()) {
                        Text("Start Learning")
                            .tint(.indigo)
                            .font(.headline)
                    }
                    .buttonStyle(.borderedProminent)
                    .clipShape(Capsule())
                    Spacer()
                }
                .padding(.top,20)
            }
            .cornerRadius(40)
            .padding(.bottom, -40)
        }
    }
}

struct InitialView_Previews: PreviewProvider {
    static var previews: some View {
        InitialView()
    }
}
