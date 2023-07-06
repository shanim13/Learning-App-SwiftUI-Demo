//
//  ClassesDetailView.swift
//  Education
//
//  Created by Shanim on 30/03/23.
//

import SwiftUI

struct ClassesDetailView: View {

    var course: CoursesData

    @State private var isExpanded: Bool = false
    @State private var showViewButton: Bool = false

    private var moreLessText: String {

        if showViewButton {
            return isExpanded ? "See Less" : "See More"
        } else {
            return ""
        }
    }

    var body: some View {

        ScrollView(.vertical, showsIndicators: false) {
            
            VStack(alignment: .center, spacing: 0) {
                ClassHeaderView(course: course)
                VStack(alignment: .leading, spacing: 20) {

                    Text(course.name)
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .foregroundColor(.indigo)

                    Text(course.subject)
                        .font(.title)
                        .multilineTextAlignment(.leading)

                    PremiumView(course: course)

                    ZStack {
                        Color.purple.opacity(0.1)
                        VStack {
                            Text("Learn more about \(course.name.uppercased())")
                                .font(.title3)
                                .fontWeight(.bold)
                                .foregroundColor(.indigo)
                                .multilineTextAlignment(.center)

                            ZStack {

                                Text(course.description)
                                    .multilineTextAlignment(.leading)
                                    .lineLimit(isExpanded ? nil : 4)
                                    .font(.body)
                                ScrollView(.vertical){
                                    Text(course.description)
                                        .multilineTextAlignment(.leading)
                                        .font(.body)
                                        .background(
                                            GeometryReader { result in
                                                Color.clear
                                                    .onAppear {
                                                        showViewButton = result.size.height > CGFloat(22 * 3)
                                                    }
                                                    .onChange(of: course.description) {_ in
                                                        showViewButton = result.size.height > CGFloat(22 * 3)
                                                    }
                                            })
                                }
                                .opacity(0.0)
                                .disabled(true)
                                .frame(height: 0.0)
                            }
                            Button(action: {
                                withAnimation {
                                    isExpanded.toggle()
                                }
                            }, label: {
                                Text(moreLessText)
                                    .font(.body)
                                    .foregroundColor(.indigo)
                            })
                            .opacity(showViewButton ? 1.0 : 0.0)
                            .disabled(!showViewButton)
                            .frame(height: showViewButton ? nil : 0.0)

                        }
                        .padding()
                    }
                    .cornerRadius(40)
                }
                .padding(.horizontal, 20)
                .frame( maxWidth: 640, alignment: .center)
            }
        }
//        .edgesIgnoringSafeArea(.top)
    }
}

struct ClassesDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ClassesDetailView(course: ModelData().courseDataArray[0])
    }
}
