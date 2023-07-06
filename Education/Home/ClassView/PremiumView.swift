//
//  premiumView.swift
//  Education
//
//  Created by Shanim on 31/03/23.
//

import SwiftUI

struct PremiumView: View {
    var course: CoursesData

    var body: some View {
        GroupBox(){
            DisclosureGroup("Start your course today"){
                Divider().padding(.vertical,2)

                HStack {
                    if course.isPremium {
                        Group {
                            Image(systemName: "info.circle")
                            Text("Price")
                        }
                        .foregroundColor(.indigo)
                            .font(.headline)
                        Spacer(minLength: 35)
                        Text(course.price)
                            .multilineTextAlignment(.trailing)
                            .foregroundColor(.indigo)
                              .font(Font.system(.body).bold())
                    } else {
                        Group {
                            Image(systemName: "info.circle")
                            Text("Start for ")
                        }
                        .foregroundColor(.indigo)
                            .font(.headline)
                        Spacer(minLength: 35)
                        Text(course.price)
                            .multilineTextAlignment(.trailing)
                            .foregroundColor(.indigo)
                              .font(Font.system(.body).bold())
                    }
                }
            } .foregroundColor(.black)
                .tint(.black)
                .font(.title3)
                .fontWeight(.bold)
        }
    }
}

struct premiumView_Previews: PreviewProvider {
    static var previews: some View {
        PremiumView(course: ModelData().courseDataArray[2])
            .previewLayout(.fixed(width: 375, height: 480))
            .padding()
    }
}
