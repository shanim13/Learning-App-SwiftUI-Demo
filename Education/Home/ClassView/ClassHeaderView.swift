//
//  ClassHeaderView.swift
//  Education
//
//  Created by Shanim on 30/03/23.
//

import SwiftUI

struct ClassHeaderView: View {

    var course: CoursesData
    @State private var isAnimatingImage: Bool = false

    var body: some View {
        ZStack {
            course.image
                .resizable()
                .scaledToFit()
                .shadow(radius: 5)
                .padding(.vertical, 20)
                .scaleEffect(isAnimatingImage ? 1.0 : 0.6)
        }
        .frame(height: 300)
        .onAppear(){
            withAnimation(.easeOut(duration: 0.5)) {
                isAnimatingImage = true
            }
        }
    }
}

struct ClassHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ClassHeaderView(course: ModelData().courseDataArray[0])
            .previewLayout(.fixed(width: 375, height: 340))
    }
}
