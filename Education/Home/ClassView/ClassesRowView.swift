//
//  ClassesRowView.swift
//  Education
//
//  Created by Shanim on 30/03/23.
//

import SwiftUI

struct ClassesRowView: View {
    
    var course: CoursesData
    var body: some View {
        HStack {
            course.image
                .renderingMode(.original)
                .resizable()
                .scaledToFit()
                .frame(width: 80, height: 80, alignment: .center)
                .shadow(color: Color(red: 0, green: 0, blue: 0,opacity: 0.3), radius: 3, x: 2, y: 2)
                .cornerRadius(8)

            VStack(alignment: .leading, spacing: 5, content: {
                Text(course.name)
                    .font(.title2)
                    .fontWeight(.bold)
                Text(course.subject)
                    .font(.caption)
                    .foregroundColor(.secondary)

            })
        }
    }
}

struct ClassesRowView_Previews: PreviewProvider {

    static var courseData = ModelData().courseDataArray

    static var previews: some View {
        ClassesRowView(course: courseData[0])
    }
}

