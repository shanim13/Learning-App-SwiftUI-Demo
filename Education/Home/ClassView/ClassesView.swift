//
//  ClassesView.swift
//  Education
//
//  Created by Shanim on 27/03/23.
//

import SwiftUI

struct ClassesView: View {
    var courseData: [CoursesData] = ModelData().courseDataArray
    var body: some View {

        NavigationView {
            VStack {
                List() {
                    ForEach(courseData.shuffled()) { item in
                        NavigationLink(
                            destination: ClassesDetailView(course: item))
                        {
                            ClassesRowView(course: item)
                                .padding(.vertical,4)
                        }
                    }
                }
            }
            .navigationBarTitle("Courses", displayMode: .inline)
        }
    }
}

struct ClassesView_Previews: PreviewProvider {
    static var previews: some View {
        ClassesView()
    }
}
