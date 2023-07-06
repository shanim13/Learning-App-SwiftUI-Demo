//
//  TutorsListRowView.swift
//  Education
//
//  Created by Shanim on 31/03/23.
//

import SwiftUI

struct TutorsListRowView: View {
    let tutor: Results
    
    var body: some View {
        HStack(spacing: 30){

            AsyncImage(url: URL(string: tutor.picture.medium)) { image in
                image
                    .resizable()
                    .scaledToFill()
            } placeholder: {
                Color.purple.opacity(0.1)
            }
            .frame(width: 90, height: 90, alignment: .center)
            .shadow(color: Color(red: 0, green: 0, blue: 0,opacity: 0.3), radius: 3, x: 2, y: 2)
            .cornerRadius(45)
            .padding(.leading, 20)
            
            VStack(alignment: .leading, spacing: 5, content: {
                Text(tutor.name.first + " " + tutor.name.last)
                    .font(.title2)
                    .fontWeight(.bold)
                Text(tutor.email)
                    .font(.caption)
                    .foregroundColor(.secondary)
            })
            Spacer()
        }
    }
}

struct TutorsListRowView_Preview: PreviewProvider {
    
    static let tutors = Tutors(results: [Results(gender: "male", name: Name(title: "Teacher", first: "John", last: "Doe"), location: Location(city: "San Francisco", state: "CA"), email: "john.doe@example.com", dob: Dob(date: "1980-01-01", age: 40), phone: "555-1234", cell: "555-5678", picture: Picture(large: "programming", medium: "programming", thumbnail: "programming"), nat: "US")])
    
    static var previews: some View {
        TutorsListRowView(tutor: tutors.results[0])
    }
}
