//
//  TutorsDetailView.swift
//  Education
//
//  Created by Shanim on 01/04/23.
//

import SwiftUI

struct TutorsDetailView: View {

    let tutor: Results

    var body: some View {
        ZStack {
            Color.purple.opacity(0.1).edgesIgnoringSafeArea(.all)

            VStack(alignment: .center){
                AsyncImage(url: URL(string: tutor.picture.large)) { image in
                    image
                        .resizable()
                        .scaledToFill()
                } placeholder: {
                    Color.purple.opacity(0.1)
                }
                .frame(width: 160, height: 160, alignment: .center)
                .shadow(color: Color(red: 0, green: 0, blue: 0,opacity: 0.3), radius: 3, x: 2, y: 2)
                .cornerRadius(80)
                .padding(.leading, 20)


                VStack(alignment: .center){
                    Text(tutor.name.first + " " + tutor.name.last)
                        .padding(.bottom, 2)
                        .font(.title2)
                        .fontWeight(.bold)

                    Text(tutor.email)
                        .font(.headline)
                    Text(tutor.phone)
                        .font(.headline)
                        .padding(.bottom, 2)


                    Text(tutor.location.state + ", " + tutor.location.city + "\n" + tutor.nat)
                        .font(.headline)
                        .padding(.bottom, 10)

                    HStack {
                        Image(systemName: "book")

                        Text("Consultant")
                        .font(.title3)
                        .fontWeight(.bold)
                    }
                }
                .fontWeight(.semibold)
                .foregroundColor(.indigo)
                .multilineTextAlignment(.center)
            }
        }
        .frame(width: 340, height: 500, alignment: .center)
        .cornerRadius(80)
    }
}

struct TutorsDetailView_Previews: PreviewProvider {
    
    static let tutors = Tutors(results: [Results(gender: "male", name: Name(title: "Teacher", first: "John", last: "Doe"), location: Location(city: "San Francisco", state: "CA"), email: "john.doe@example.com", dob: Dob(date: "1980-01-01", age: 40), phone: "555-1234", cell: "555-5678", picture: Picture(large: "programming", medium: "programming", thumbnail: "programming"), nat: "US")])

    static var previews: some View {
        TutorsDetailView(tutor: tutors.results[0])
    }
}
