//
//  CourseCollectionView.swift
//  Education
//
//  Created by Shanim on 27/03/23.
//

import SwiftUI

struct CourseCollectionView: View {

    var subject: Subject

    var body: some View {

        VStack {
            HStack {

                Image(subject.image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 160, height: 180)
                    .padding(.horizontal, 5)

                VStack {
                    Text(subject.title)
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundColor(.indigo)

                    Text(subject.subject)
                        .font(.title2)
                        .fontWeight(.medium)
                        .foregroundColor(.indigo)

                    Text(subject.duration)
                        .font(.subheadline)
                        .fontWeight(.regular)
                        .foregroundColor(.indigo)
                        .padding(.bottom, 10)

                    ProgressView("\(Int(subject.progress))% Completed", value: subject.progress, total: 100)
                        .font(.headline)
                        .tint(.indigo)
                        .foregroundColor(.indigo)
                        .padding(.horizontal, 10)
                } .padding(.horizontal, 5)
            }
        } .overlay(
        RoundedRectangle(cornerRadius: 15)
            .stroke(Color.indigo, lineWidth: 2)
            .shadow(color: .indigo, radius: 4))
        .padding(.horizontal, 10)
        .padding(.bottom, 420)
    }
}

struct CourseCollectionView_Previews: PreviewProvider {
    static var previews: some View {
        CourseCollectionView(subject: Subject.init(title: "Programming", image: "programming", subject: "Computers", duration: "3hr:30min", progress: 100))
    }
}
